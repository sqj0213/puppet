define redis_zone::service_masterslave(
        $port = '6479' ,
        $config_loglevel = 'notice' ,
        $config_timeout = '300' ,
        $ensure = 'running',
	$maxmemory = '10',
        $masterip = '127.0.0.1'
) {
  	if $ipaddress_em2==$masterip{
        	$is_master = true
  	}else{
        	$is_master = false
  	}
  	redis_zone::service{"ms_service_${port}":
        	port		=>$port,
        	ensure		=>$ensure,
        }
	redis_zone::config{"redis_zone::config_$port":
		port		=>$port,
		is_master	=>$is_master,
        	masterip	=>$masterip,
		maxmemory	=>$maxmemory,
        	ipaddress	=>$ipaddress_em2,
	}
}
