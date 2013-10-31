class nrpe($ip = '127.0.0.1',$type = 'default',$port = 80,$area = 'bj') {
	#include nrpe::install
	nrpe::config{"nrpe-2.13":
		cpunumber => $processorcount,
		ip	  => $ip,
		type	  => $type,
		port	  => $port,
	}
#	include nrpe::service
}
