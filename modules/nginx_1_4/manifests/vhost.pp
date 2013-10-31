define nginx_1.4::vhost(
	$port	= 80,
	$vhost	= 'test',
){
	file{"vhost_dir_$vhost":
	        ensure => directory,
        	path    => "/data/www/htdocs/$vhost",
        	mode   => 755,
        	group  => 'root',
        	owner  => 'root'	
	}






}
