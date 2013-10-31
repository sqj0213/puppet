define nginx_1_4::service (
	$port	= 8080,
	$area	= 'hz',
	$ensure	= 'stopped',
){
	file { "nginx_service_conf_$port":
		ensure	=> file,
		path    => "/etc/nginx/nginx.conf",
		content	=> template("${module_name}/squid_frontend.nginx.conf.erb"),
        	mode	=> 0644,
        	group	=> 'root',
        	owner	=> 'root'
	}	
	file {"nginx_usr_sbin_nginx":
                ensure  => file,
                path    => '/usr/sbin/nginx',
                source  => 'puppet:///modules/nginx_1_4/nginx.1.4.1',
		mode	=> 0755,
        	group	=> 'root',
        	owner	=> 'root'
        }	
	file {"nginx_fast_cgi_conf":
		ensure  => file,
                path    => '/etc/nginx/fastcgi.conf',
                source  => 'puppet:///modules/nginx_1_4/fastcgi.conf',
	}
	
	service {"nginx_service_$port":
		ensure		=> $ensure ,
		name		=> 'nginx',
		enable		=> true,
		subscribe	=> File["nginx_service_conf_$port"],
        	provider	=> 'redhat' ,
        	require		=> File["nginx_service_conf_$port"] ,
		start		=> "/etc/init.d/nginx start",
		stop		=> "/etc/init.d/nginx stop",
		restart		=> "/etc/init.d/nginx restart",
		status		=> "/etc/init.d/nginx status"
	}
}
