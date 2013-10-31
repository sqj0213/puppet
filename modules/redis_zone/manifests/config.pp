define redis_zone::config (
	$port  = '6479',
        $masterip  = '127.0.0.1',
	$is_master = undef,
        $ipaddress = '127.0.0.1',
	$maxmemory = '10'
){
	file { "redis_dir_${port}":
        	ensure => directory,
        	path   => "/data/redis_${port}",
        	mode   => 755,
        	group  => 'redis',
        	owner  => 'redis'
  	}
  	file { "redis_config_${port}": 
        	ensure    => file , 
        	path      => "/data/redis_${port}/redis_${port}.conf" , 
        	content   => $is_master ? { 
                        true 	=> template("${module_name}/master.redis.conf.erb") , 
                        false	=> template("${module_name}/slave.redis.conf.erb"),
                        undef	=> template("${module_name}/standonly.redis.conf.erb")
                        },
        	require   => File["redis_dir_${port}"]
  	}
	file { "redis_upstart_${port}": 
        	ensure    => file , 
        	path      => "/etc/init.d/redis_$port",
        	content   => template("${module_name}/redis.server.erb") , 
        	require   => File["redis_dir_${port}"],
        	mode      => 755
  	}
}
