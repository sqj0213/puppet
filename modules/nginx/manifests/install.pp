define nginx::install($ver=''){
	package	{"nginx_$ver":
		name    => 'nginx-1.2.1-1.el6.ngx',
                ensure  => 'installed',
                provider=> 'yum',
	}
	
}
