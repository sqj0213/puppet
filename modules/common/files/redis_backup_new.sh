#!/bin/sh

for i in $(netstat -nlpt|grep redis|awk -F: '{print $2}'|awk '{print $1}');do
	idt=$(redis-cli -p $i info |grep role|awk -F: '{print $2}'|tr -d '\r')
	echo $idt
	case $idt in
	slave)
 		redis-cli -p $i bgsave
		;;
	master)
  		echo redis-cli -p $i bgrewriteaof
		;;
	*)
		exit 1
		;; 
	esac
done

sleep 600

time=`date +"%Y%m%d"`
echo "------------start--------------$time------------------" >>/data/backup/redis_backup.log
if ! [ -d /data/backup/redis/$time ];then
	/bin/mkdir -p /data/backup/redis/$time
fi

for i in $(find /data/ -name "appendonly*.aof" -ctime -1);do
 	echo cp $i /data/backup/redis/$time >>/data/backup/redis_backup.log
 	/bin/cp -f $i /data/backup/redis/$time
done

for i in $(find /data/ -name "dump*.rdb" -ctime -1);do
 	echo cp $i /data/backup/redis/$time >>/data/backup/redis_backup.log
 	/bin/cp -f $i /data/backup/redis/$time
done

cd /data/backup/redis
tar zcf redis_$time.tar.gz $time
/bin/rm -rf $time
echo "-----------finish--------------$time----------------" >> /data/backup/redis_backup.log

## delete
find /data/backup/redis -name "redis_*" -mtime +10 -exec  rm -f {} \;
