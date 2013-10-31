class nginx_1_4(
	$port=8080,
	$area = 'hz',
	$ensure='stopped'
){
	nginx_1_4::service{"nginx_$port":
		port	=> $port,
		area	=> $area,
		ensure	=> $ensure
	}	
}
