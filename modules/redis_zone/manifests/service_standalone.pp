define redis_zone::service_standalone(
        $port = '6487' ,
        $config_bind_device = 'em2' ,
        $config_loglevel = 'notice' ,
        $config_timeout = '300' ,
        $ensure = 'running',
        $masterip = '127.0.0.1',
	$macmemory = '10',
){
  	redis_zone::service{"standalone_$port":
        	port=>$port,
        #	masterip=>$masterip,
        	ensure=>$ensure,
        #	ipaddress=>$ipaddress
        }
        redis_zone::config{"redis_zone_config_$port":
                port            =>$port,
                ipaddress       =>$ipaddress_em2,
        	masterip	=>$masterip,
                maxmemory       =>$maxmemory
        }
}
