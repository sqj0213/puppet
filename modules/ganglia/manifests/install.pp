class ganglia::install(){
        package {'ganglia.x86_64':
		name 	 => ganglia,
                ensure   => installed,
                provider => 'yum',
        }
	package {'ganglia-gmond.x86_64':
		name     => ganglia-gmond,
		ensure   => installed,
		provider => 'yum',
	}
#	package {'ganglia-gmond-python.x86_64':
#		name     => ganglia-gmond-python,
#		ensure   => installed,
#		provider => 'yum',
#	}
}

