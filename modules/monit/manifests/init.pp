class monit($type='default') {
        package {'monit-5.1.1':
                ensure  => 'installed',
                provider=> 'yum',
        }

        file {'monit.conf': 
                ensure  => file,
                path    => '/etc/monit.conf',
		source  => $type ? {
			web 	=> "puppet://$puppetserver/modules/monit/web_monit.conf",
			default	=> "puppet://$puppetserver/modules/monit/monit.conf",
			},
                require => Package['monit-5.1.1'],
                mode    => 0600,
                group   => 'root',
                owner   => 'root'
        }

        service { 'monit-service':
                ensure    => 'running',
                name      => 'monit',
                enable    => true,
                subscribe => [File['monit.conf']],
                provider  => 'redhat', 
                require   => [File['monit.conf']],
                start     => "/etc/init.d/monit start",
                stop      => "/etc/init.d/monit stop",
                restart   => "/etc/init.d/monit restart",
                status    => "/etc/init.d/monit status",
        }
}
