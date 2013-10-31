class nutcracker ($type='bj') {
        package {'nutcracker-0.2.3-1':
                ensure  => installed,
                provider=> 'rpm',
#                source  => "puppet://$puppetserver/nutcracker/nutcracker-0.2.3-1.x86_64.rpm",
                source  => 'http://123.103.21.139/nutcracker-0.2.3-1.x86_64.rpm',
        }

        file {'nutcracker.yml': 
                ensure  => file,
                path    => '/etc/nutcracker/nutcracker.yml',
                require => Package['nutcracker-0.2.3-1'],
                source => $type ? {
                        bj     => 'puppet:///modules/nutcracker/nutcracker_bj.yml',
                        ts     => 'puppet:///modules/nutcracker/nutcracker_ts.yml',
                        hz     => 'puppet:///modules/nutcracker/nutcracker_hz.yml',
			},
                mode    => 0644,
                group   => 'root',
                owner   => 'root'
        }

        file {'nutcracker.init': 
                ensure  => file,
                path    => '/etc/rc.d/init.d/nutcracker',
		source  => "puppet://$puppetserver/modules/nutcracker/nutcracker",
                mode    => 0755,
                group   => 'root',
                owner   => 'root'
        }

        service { 'nutcracker-service':
                ensure    => 'running',
                name      => 'nutcracker',
                enable    => true,
                subscribe => [File['nutcracker.yml','nutcracker.init']],
                provider  => 'redhat', 
                require   => [File['nutcracker.yml','nutcracker.init']],
                start     => "/etc/init.d/nutcracker start",
                stop      => "/etc/init.d/nutcracker stop",
                restart   => "/etc/init.d/nutcracker restart",
                status    => "/etc/init.d/nutcracker status",
        }
}
