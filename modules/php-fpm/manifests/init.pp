class php-fpm($session_save_path='/var/lib/php/session',$session_save_handler='files',$fpm_save_path='yes',$upload_max_filesize='2M',$type='default'){
	#package {'php-fpm-5.4':
	#	name	=> 'php54-fpm-5.4.4-1.ius.el6',
	#	ensure	=> 'installed',
	#	provider=> 'yum'
	#}
	
	#file { 'php.ini':
	#	todo:使php.ini and /etc/php.d/*.ini 的修改对php-fpm-service 生效
	#}

	file{'php-fpm.conf': 
		ensure	=> file,
		path	=> '/etc/php-fpm.conf',
    		source	=> 'puppet:///modules/php-fpm/php-fpm.conf',	
		mode    => 0644,
        	group   => 'root',
		owner   => 'root'	
		
	}	

	file{'php-fpm.d.www.conf': 
		ensure	=> file,
		path	=> '/etc/php-fpm.d/www.conf',
		content => $type ? {
			manage	=> template("${module_name}/manage_php-fpm.d.www.conf.erb"),
			default => template("${module_name}/php-fpm.d.www.conf.erb"),
			},
		mode    => 0644,
        	group   => 'root',
		owner   => 'root'	
	}	

	file{'php.ini':
		ensure  => file,
		path	=> '/etc/php.ini',
		content => template("${module_name}/php.ini.erb"),
		mode	=> 0644,
		group   => 'root',
		owner	=> 'root'
	}
	
	file{'apc.ini':
		ensure	=> file,
		path	=> '/etc/php.d/apc.ini',
		source	=> 'puppet:///modules/php-fpm/apc.ini',
		mode	=> 0644,
		group	=> 'root',
		owner	=> 'root'	
	}

	service { 'php-fpm-service':
		ensure		=>'running',
		name		=>'php-fpm',
		enable		=> true,
		#subscribe	=>[File['php-fpm.conf'],File['php-fpm.d.www.conf'],File['php.ini']],
		provider  	=> 'redhat', 
		require   	=> [File['php-fpm.conf'],File['php-fpm.d.www.conf'],File['php.ini']],
		start		=> "/etc/init.d/php-fpm start",
		stop		=> "/etc/init.d/php-fpm stop",
		restart		=> "/etc/init.d/php-fpm reload",
		status		=> "/etc/init.d/php-fpm status",
	}
}
