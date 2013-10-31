class nrpe::install(){
        package {"nrpe":
                name    => 'nrpe-2.13-1.el6.x86_64',
                ensure  => 'installed',
                provider=> 'rpm',
		source  => 'http://123.103.21.139/nrpe-2.13-1.el6.x86_64.rpm',
        }

	package {"nagios-plugins":
		name    => 'nagios-plugins.x86_64',
		ensure  => 'installed',
		provider=> 'yum'
	}

	package {"nagios-plugins-all":
		name    => 'nagios-plugins-all.x86_64',
		ensure  => 'installed',
		provider=> 'yum'
	}

	package {"nagios-plugins-nrpe":
		name    => 'nagios-plugins-nrpe.x86_64',
		ensure  => 'installed',
		provider=> 'yum'
	}
}
