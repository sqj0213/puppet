class nrpe::service {
        service {"nrpe":
                ensure     => running,
                enable     => true,
		subscribe  => [File['/etc/nagios/nrpe.cfg']],
		start 	   => '/etc/init.d/nrpe start',
		stop	   => '/etc/init.d/nrpe stop',
                restart    => '/etc/init.d/nrpe restart',
                status     => '/etc/init.d/nrpe status',
                require    => File["/etc/nagios/nrpe.cfg"]
        }
}
