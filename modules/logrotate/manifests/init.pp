class logrotate ($is_gearman_worker='default',$is_nginx='default',$is_php='default',$is_mysql='default'){
        file { "/etc/logrotate.d/nginx":
                ensure  => file,
                path    => '/etc/logrotate.d/nginx',
                source  => $is_nginx ? {
			true	=> 'puppet:///modules/logrotate/nginx',
			default	=> undef,
		},
        }

        file { "/etc/logrotate.d/php-fpm":
                ensure  => file,
                path    => '/etc/logrotate.d/php-fpm',
                source  => $is_php ? {
			true	=> 'puppet:///modules/logrotate/php-fpm',
			default	=> undef,
		},
        }

	file { "/etc/logrotate.d/mysql":
		ensure	=> file,
		path	=> '/etc/logrotate.d/mysql',
		mode	=> '0755',
		source	=> $is_mysql ? {
			true	=> 'puppet:///modules/logrotate/mysql',
			default	=> undef,
		},
	}

	file { "/etc/logrotate.d/gearman-worker":
		ensure	=> file,
		path	=> '/etc/logrotate.d/gearman-worker',
		source	=> $is_gearman_worker ? {
			true	=> 'puppet:///modules/logrotate/gearman-worker',
			default	=> undef,
		},
	}

        file { "/etc/cron.daily/logrotate":
                ensure  => file,
                path    => '/etc/cron.daily/logrotate',
		mode 	=> '0755',
                source  => 'puppet:///modules/logrotate/logrotate',
        }
}
