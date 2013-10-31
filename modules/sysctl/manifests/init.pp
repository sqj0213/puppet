class sysctl($type='default'){
        file {'sysctl.conf':
                ensure  => file,
                path    => '/etc/sysctl.conf',
                content  => $type ? {
			web	=> template("${module_name}/web_sysctl.conf.erb"),
			mysql 	=> template("${module_name}/mysql_sysctl.conf.erb"),
			redis 	=> template("${module_name}/redis_sysctl.conf.erb"),
			haproxy => template("${module_name}/haproxy_sysctl.conf.erb"),
			default => undef,
			},
                mode    => 0644,
                group   => 'root',
                owner   => 'root',
        }

        exec{"/sbin/sysctl -p":
                path    	=> "/usr/bin:/usr/sbin:/bin:/sbin",
		subscribe 	=> [File['sysctl.conf']],
                user    	=> root,
		require		=> File['sysctl.conf'],
		refreshonly 	=> true,
        }
}
