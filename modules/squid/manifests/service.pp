define squid::service (
	$port	= 80,
	$datapath='/data/squid',
	$cachepeer1='123.103.21.144',
	$cachepeer2='123.103.21.145',
	$max_obj_size_in_mem=5192,
	$cache_mem=8192,
	$ensure	= 'stopped',
	$type = 'hz',
	$ip   = '172.16.2.21',
){
	file { "squid_dir_${port}":
                ensure => directory,
                path   => $datapath,
                mode   => "0755",
                group  => 'www',
                owner  => 'www'
        }

	file { "squid_dir_cache_${port}":
                ensure => directory,
                path   => "$datapath/cache",
                mode   => "0755",
                group  => 'www',
                owner  => 'www'
        }

	file { "squid_dir_logs_${port}":
                ensure => directory,
                path   => "$datapath/logs",
                mode   => "0755",
                group  => 'www',
                owner  => 'www'
        }

	file { "squid_service_conf_$port":
		ensure	=> file,
		path    => "/etc/squid/squid.$port.conf",
		content	=> $type ? {
		hz	=> template("${module_name}/etc.squid.conf.erb"),
		ts	=> template("${module_name}/etc.squid.conf.erb"),
		bj	=> template("${module_name}/etc.squid.storage.conf.erb"),	
		bj_new	=> template("${module_name}/etc.squid.storage_new.conf.erb"),	
		},
        	mode	=> 0644,
        	group	=> 'root',
        	owner	=> 'root'
	}	

	file {"squid_sysconfig_conf_$port":
		ensure  => file,
                path    => "/etc/sysconfig/squid$port",
                content => template("${module_name}/sysconfig.squid.erb"),
	}

	file {"squid_init.d_$port":
                ensure  => file,
                path    => "/etc/rc.d/init.d/squid_$port",
                content => template("${module_name}/etc.init.d.squid.erb"),
		mode	=> 0755
        }
	
	service {"squid_service_init_$port":
		ensure		=> $ensure ,
		name		=> "squid_$port",
		enable		=> true,
		#subscribe	=> File["squid_service_conf_$port","squid_sysconfig_conf_$port","squid_init.d_$port"],
	       	provider	=> 'redhat' ,
        	require		=> File["squid_service_conf_$port","squid_dir_${port}","squid_dir_cache_${port}","squid_dir_logs_${port}"] ,
		start		=> "/etc/init.d/squid_$port start",
		stop		=> "/etc/init.d/squid_$port stop",
		restart		=> "/etc/init.d/squid_$port restart",
		status		=> "/etc/init.d/squid_$port status"
	}
}
