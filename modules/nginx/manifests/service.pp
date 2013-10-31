define nginx::service (
	$port	= 80,
	$ensure	= 'stopped',
	$server   = 'web',
	$cpunumber
){
	file { "nginx_service_conf_$port":
		ensure	=> file,
		path    => "/etc/nginx/nginx.conf",
		content	=> $server ? {
		web		=> template("${module_name}/nginx.common.conf.erb"),
		bjweb		=> template("${module_name}/nginx.bjwww.conf.erb"),
		old_storage	=> template("${module_name}/nginx.storage.conf.erb"),
		new_storage	=> template("${module_name}/nginx.storage.conf.erb"),
		},
        	mode	=> 0644,
        	group	=> 'root',
        	owner	=> 'root'
	}	

	file {"nginx_fast_cgi_conf":
		ensure  => file,
                path    => '/etc/nginx/fastcgi.conf',
                source  => 'puppet:///modules/nginx/fastcgi.conf',
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
