class nginx(
	$port=80,
	$ensure='stopped',
	$server='web',
){
#	nginx::install{"install":}
	nginx::service{"nginx_$port":
		port	  => $port,
		cpunumber => $processorcount,
		ensure	  => $ensure,
		server	  => $server,
	}	
}
