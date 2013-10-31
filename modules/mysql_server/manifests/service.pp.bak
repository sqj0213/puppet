#import "lib/ip2long.rb"
define mysql_server::service(
	$port=3306,
	$ensure='running',
	$config_bind_device='em1'){

	$net = "ipaddress_${config_bind_device}"
  	$ipaddress = inline_template("<%= scope.lookupvar(net) %>")
	$i3 = regsubst($ipaddress,'^(\d+)\.(\d+)\.(\d+)\.(\d+)$','\3')
	$i4 = regsubst($ipaddress,'^(\d+)\.(\d+)\.(\d+)\.(\d+)$','\4')
	$serverid = "$i3$i4$port"

	file { "mysql_dir_${port}":
        	ensure => directory,
        	path    => "/data/mysql_${port}",
        	mode   => "0755",
        	group  => 'root',
        	owner  => 'mysql'
  	}
	file { "mysql_dir_data_${port}":
        	ensure => directory,
        	path    => "/data/mysql_${port}/data",
        	mode   => "0755",
        	group  => 'mysql',
        	owner  => 'mysql'
  	}

	file { "mysql_config_${port}":
        	ensure    => file ,
        	path      => "/data/mysql_${port}/mysql_${port}.cnf" ,
        	content   => template("${module_name}/my_innodb_heavy.cnf.erb") ,
			##$is_master ? {
                        ##true => template("${module_name}/master.redis.conf.erb") ,
                        ##false=> template("${module_name}/slave.redis.conf.erb"),
                        ##undef=> template("${module_name}/slave.redis.conf.erb")
                        ##},
        	require   => File["mysql_dir_${port}"]
  	}

	file { "mysql_upstart_${port}":
       		ensure    => file ,
        	path      => "/etc/init.d/mysql_$port",
        	content   => template("${module_name}/mysql.server.erb") ,
        	require   => File["mysql_dir_${port}","mysql_config_${port}"],
        	mode    => 755
  	}
	exec{"/usr/bin/mysql_install_db --datadir=/data/mysql_$port/data --user=mysql":
	#exec{"/bin/ls /data/mysql_$port >> /tmp/abc":
		path	=> "/usr/bin:/usr/sbin:/bin",
		unless	=> "test -d /data/mysql_$port/data/mysql",
		user	=> root
	}
	

	service { "mysql_${port}":
        	ensure    => $ensure ,
        	path     => "/etc/init.d/mysql_${port}",
        	subscribe       => File["mysql_config_${port}"],
        	provider  => 'redhat' ,
        	require   => [  File["mysql_upstart_${port}"] ,
                        File["mysql_config_${port}"] ],
        	start   => "/etc/init.d/mysql_${port} start",
        	stop    => "/etc/init.d/mysql_${port} stop",
        	restart => "/etc/init.d/mysql_${port} restart",
        	status  => "/etc/init.d/mysql_${port} status"
	}

}
