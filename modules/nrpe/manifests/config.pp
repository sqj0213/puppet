define nrpe::config($cpunumber = 8,$ip = '127.0.0.1',type = 'default',port = 80){
        file { "check_partition":
                ensure  => file,
                path    => "/usr/lib64/nagios/plugins/check_partition",
                mode    => 755,
                source  => "puppet:///modules/nrpe/check_partition"
        }
        file {"/etc/nagios/nrpe.cfg":
		content => $type ? {
			web 		=> template("${module_name}/nrpe_web.cfg.erb"),
			mysql 		=> template("${module_name}/nrpe_mysql.cfg.erb"),
			redis 		=> template("${module_name}/nrpe_redis.cfg.erb"),
			ha_varnish	=> template("${module_name}/nrpe_ha_varnish.cfg.erb"),
			default 	=> template("${module_name}/nrpe.cfg.erb"),
			},
                mode    => 0644,
                owner   => "root",
                group   => "root",
#		require => Package['nrpe-2.13-1.el6.x86_64']
        }
}
