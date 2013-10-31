define varnish::service( $port=6081,
		$backends=[ {name=>'gximg1',ip=>'172.16.3.10',port=>'8080'} ],
		$mem_sieze=24,
		$ensure='stopped'
		) {
        file {"default.$port.vcl": 
                ensure  => file,
                path    => "/etc/varnish/default.$port.vcl",
		content => template("${module_name}/default.vcl.erb"),
                mode    => 0644,
                group   => 'root',
                owner   => 'root'
        }

        file {"sysconfig.varnish.$port":
                ensure  => file,
                path    => "/etc/sysconfig/varnish.$port",
		content => template("${module_name}/sysconfig.varnish.erb"),
                mode    => 0644,
                group   => 'root',
                owner   => 'root'
        }

        file {"varnish.$port.init":
                ensure  => file,
                path    => "/etc/rc.d/init.d/varnish_$port",
		content => template("${module_name}/etc_init_d_varnish.erb"),
                mode    => 0755,
                group   => 'root',
                owner   => 'root'
        }

#        service {"varnish.$port.service":
#                ensure          =>$ensure,
#                name            =>"varnish_$port",
#                enable          => true,
#                #subscribe       =>[File["default.$port.vcl"],File["sysconfig.varnish.$port"]],
#                provider  => 'redhat', 
#                require   => [File["default.$port.vcl"],File["sysconfig.varnish.$port"],File["varnish.$port.init"]],
#                start   => "/etc/init.d/varnish_$port start",
#                stop    => "/etc/init.d/varnish_$port stop",
#                restart => "/etc/init.d/varnish_$port restart",
#                status  => "/etc/init.d/varnish_$port status",
#        }
}
