class mcollective($type='common') {
        file {'mcollective_server.cfg': 
                ensure  => file,
                path    => '/etc/mcollective/server.cfg',
		source  => $type ? {
			default	=> "puppet://$puppetserver/modules/mcollective//mcollective_server.cfg",
			},
                mode    => 0600,
                group   => 'root',
                owner   => 'root'
        }

        service { 'mcollective-service':
                ensure    => 'running',
                name      => 'mcollective',
                enable    => true,
                subscribe => [File['mcollective_server.cfg']],
                provider  => 'redhat', 
                require   => [File['mcollective_server.cfg']],
                start     => "/etc/init.d/mcollective start",
                stop      => "/etc/init.d/mcollective stop",
                restart   => "/etc/init.d/mcollective restart",
                status    => "/etc/init.d/mcollective status",
        }
}
