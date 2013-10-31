class ssh_server($port=22,root="yes"){
	package { 'openssh-server':
    		ensure => installed,
	}

	file { 'sshd_config':
		ensure 	=> file,
		path	=> "/etc/ssh/sshd_config",
		content	=> template("${module_name}/sshd_config.erb"),
		mode    => 0644,
                group   => 'root',
                owner   => 'root'
	}

        service { 'sshd-service':
                ensure    => 'running',
                name      => 'sshd',
                enable    => true,
                subscribe => [File['sshd_config'],Package['openssh-server']],
                provider  => 'redhat',
                require   => [File['sshd_config'],Package['openssh-server']],
                start     => "/etc/init.d/sshd start",
                stop      => "/etc/init.d/sshd stop",
                restart   => "/etc/init.d/sshd restart",
                status    => "/etc/init.d/sshd status",
        }
}
