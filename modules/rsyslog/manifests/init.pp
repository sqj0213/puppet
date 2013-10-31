class rsyslog($ip='172.16.3.4',$type='default',$host='default',$is_gearman_worker='default') {
#        package {'rsyslog-7.2.6-3.el6':
#                name      => 'rsyslog-7.2.6-3.el6.x86_64',
#                ensure    => 'installed',
#                provider  => 'yum'
#        }

        file {'rsyslog.conf': 
                ensure    => file,
                path      => '/etc/rsyslog.conf',
		content   => $type ? {
			  web		=> template("${module_name}/etc.rsyslog_web.conf.erb"),
			  default	=> template("${module_name}/etc.rsyslog_default.conf.erb"),
			  },
                mode      => 0644,
                group     => 'root',
                owner     => 'root'
        }

        file {'FrontSend.conf':
                ensure    => file,
                path      => '/etc/rsyslog.d/FrontSend.conf',
                content   => $type ? { 
			  web		  => template("${module_name}/etc.rsyslog.d.webFrontSend.conf.erb"),
			  sso		  => template("${module_name}/etc.rsyslog.d.ssoFrontSend.conf.erb"),
			  pic		  => template("${module_name}/etc.rsyslog.d.picSend.conf.erb"),
			  fastdfs	  => template("${module_name}/etc.rsyslog.d.fastdfsSend.conf.erb"),
			  storage	  => template("${module_name}/etc.rsyslog.d.storageSend.conf.erb"),
			  redis		  => template("${module_name}/etc.rsyslog.d.redisFrontSend.conf.erb"),
			  gearman_worker  => template("${module_name}/etc.rsyslog.d.gearman_worker.conf.erb"),
			  default	  => undef
			  },
                mode      => 0644,
                group     => 'root',
                owner     => 'root',
                backup    => '.bak',
        }
	
	file {'mysql.conf':
		ensure	  => file,
		path	  => '/etc/rsyslog.d/mysql.conf',
		content	  => $host ? {
			  bj8		  => template("${module_name}/etc.rsyslog.d.bj8_mysqlSend.conf.erb"),
			  bj9		  => template("${module_name}/etc.rsyslog.d.bj9_mysqlSend.conf.erb"),
			  bj12		  => template("${module_name}/etc.rsyslog.d.bj12_mysqlSend.conf.erb"),
			  bj15		  => template("${module_name}/etc.rsyslog.d.bj15_mysqlSend.conf.erb"),
			  bj16		  => template("${module_name}/etc.rsyslog.d.bj16_mysqlSend.conf.erb"),
			  bj25		  => template("${module_name}/etc.rsyslog.d.bj25_mysqlSend.conf.erb"),
			  default	  => undef
			  },
		mode	  => 0644,
		group	  => 'root',
		owner	  => 'root'
	}

	file {'gearman_worker.conf':
		ensure	  => file,
		path	  => '/etc/rsyslog.d/gearman_worker.conf',
		content   => $is_gearman_worker ? {
			  true		  => template("${module_name}/etc.rsyslog.d.gearman_worker.conf.erb"),
			  default	  => undef
			  },
		mode	  => 0644,
		group	  => 'root',
		owner	  => 'root'
	}

        service { 'rsyslog-service':
                ensure    => 'running',
                name      => 'rsyslog',
                enable    => true,
                subscribe => [File['rsyslog.conf'],File['FrontSend.conf'],File['mysql.conf']],
                provider  => 'redhat', 
                require   => [File['rsyslog.conf'],File['FrontSend.conf'],File['mysql.conf']],
                start     => "/etc/init.d/rsyslog start",
                stop      => "/etc/init.d/rsyslog stop",
                restart   => "/etc/init.d/rsyslog restart",
                status    => "/etc/init.d/rsyslog status",
        }
}
