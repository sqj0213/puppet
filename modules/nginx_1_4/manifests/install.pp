define nginx::install($ver='1.4.1'){
	package	{"nginx_1.4.1":
		name    => 'nginx-1.4.1-1.el6.ngx.x86_64'
                ensure  => 'installed',
                provider=> 'yum',
	}
	
}
