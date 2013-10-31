#import "lib/ip2long.rb"
define mysql_server::service(
	$port=3306,
	$ensure='running',
	$config_bind_device='em1',
	$type='master',
	$innodb_buffer_pool_size='8G',
        $max_connections=4096,
        $max_heap_table_size='64M',
        $read_buffer_size='32M',
        $read_rnd_buffer_size='16M',
        $sort_buffer_size='32M',
        $join_buffer_size='8M',
        $query_cache_size='512M',
	$key_buffer_size='32M',
        $innodb_flush_log_at_trx_commit=1,
	$innodb_buffer_pool_instances=2){

#	$net = "ipaddress_${config_bind_device}"
#  	$ipaddress = inline_template("<%= scope.lookupvar(net) %>")
	$i3 = regsubst($ipaddress,'^(\d+)\.(\d+)\.(\d+)\.(\d+)$','\3')
	$i4 = regsubst($ipaddress,'^(\d+)\.(\d+)\.(\d+)\.(\d+)$','\4')
	$serverid = "$i3$i4$port"
	
#	notify { "$serverid  $i3  $i4 $ipaddress $net":}

	file { "mysql_dir_${port}":
        	ensure => directory,
        	path   => "/data/mysql_${port}",
        	mode   => "0755",
        	group  => 'root',
        	owner  => 'mysql'
  	}

	file { "mysql_dir_data_${port}":
        	ensure => directory,
        	path   => "/data/mysql_${port}/data",
        	mode   => "0755",
        	group  => 'mysql',
        	owner  => 'mysql'
  	}

	file { "mysql_config_${port}":
        	ensure    => file ,
        	path      => "/data/mysql_${port}/mysql_${port}.cnf" ,
		content   => $type ? {
                       	"master" 		=> template("${module_name}/master.my_innodb_heavy.cnf.erb"),
                        "master_candidate"	=> template("${module_name}/master_candidate.my_innodb_heavy.cnf.erb"),
                        "slave_myisam"		=> template("${module_name}/slave.my_myisam_heavy.cnf.erb"),
                        "slave_innodb"		=> template("${module_name}/slave.my_innodb_heavy.cnf.erb")
                        	},
        	require   => File["mysql_dir_${port}"]
  	}

	file { "mysql_upstart_${port}":
       		ensure    => file ,
        	path      => "/etc/init.d/mysql_$port",
        	content   => template("${module_name}/mysql.server.erb") ,
        	require   => File["mysql_dir_${port}","mysql_config_${port}"],
        	mode      => 755
  	}

	exec{"/usr/bin/mysql_install_db --datadir=/data/mysql_$port/data --user=mysql":
		path	=> "/usr/bin:/usr/sbin:/bin",
		unless	=> "test -d /data/mysql_$port/data/mysql",
		user	=> root
	}
	
	service { "mysql_${port}":
        	ensure    => $ensure ,
        	path      => "/etc/init.d/mysql_${port}",
#        	subscribe => File["mysql_config_${port}"],
        	provider  => 'redhat' ,
        	require   => [ File["mysql_upstart_${port}"] ,
                               File["mysql_config_${port}"] ],
        	start     => "/etc/init.d/mysql_${port} start",
        	stop      => "/etc/init.d/mysql_${port} stop",
        	restart   => "/etc/init.d/mysql_${port} restart",
        	status    => "/etc/init.d/mysql_${port} status",
	}

}
