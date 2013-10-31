class ganglia::service {
        service {"gmond":
                ensure	   => running,
                enable     => true,
                #hasrestart => true,
                #hasstatus  => true,
        	#subscribe  => File['/etc/ganglia/gmond.conf'],
   	        #require    => Package['ganglia-gmond', 'ganglia-gmond-python'],
                start           => "/etc/init.d/gmond start",
                stop            => "/etc/init.d/gmond stop",
                restart         => "/etc/init.d/gmond restart",
                status          => "/etc/init.d/gmond status"

  	}
}
