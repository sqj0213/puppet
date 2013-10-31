define squid::fuck(
	$port=80,
	$datapath="/data/squid",
        $cachepeer1='123.103.21.144',
        $cachepeer2='123.103.21.145',
	$max_obj_size_in_mem=5192,
	$cache_mem=8192,
	$ensure='stopped',
	$type='hz',
	$ip='172.16.2.21'
){
	squid::service{"squid_$port":
		port	=> $port,
		datapath=> $datapath,
        	cachepeer1=>$cachepeer1,
        	cachepeer2=>$cachepeer2,
		max_obj_size_in_mem=>$max_obj_size_in_mem,
		cache_mem=>$cache_mem,
		ensure	=> $ensure,
		type	=> $type,	
		ip	=> $ip,
	}	
}
