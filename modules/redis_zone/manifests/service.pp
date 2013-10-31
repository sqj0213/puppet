define redis_zone::service(
        $port  	= '6479',
        $ensure = 'stopped'
){
  	service { "redis_${port}":
        	ensure    	=> $ensure , 
        	path  		=> "/etc/init.d/redis_${port}",
        	#subscribe       => File["redis_config_${port}"],
        	provider  	=> 'redhat' , 
        	require   	=> [  File["redis_upstart_${port}"] , File["redis_config_${port}"] ],
        	#start   	=> "/etc/init.d/redis_${port} start",
        	#stop    	=> "/etc/init.d/redis_${port} stop",
        	#restart 	=> "/etc/init.d/redis_${port} restart",
        	#status  	=> "/etc/init.d/redis_${port} status"
  	}
}
