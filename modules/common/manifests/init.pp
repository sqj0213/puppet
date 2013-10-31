class common($hosts='bj',$is_mysql=false,$is_haproxy=false){
#hosts为ts时，使用唐山hosts，hz时为湖州hosts,bj时为北京hosts。
	file { "/etc/hosts":
		ensure	=> file,
		path	=> '/etc/hosts',
		source  => $hosts ? {
                        ts      => 'puppet:///modules/common/ts_hosts',
                        hz      => 'puppet:///modules/common/hz_hosts',
                        bj      => 'puppet:///modules/common/bj_hosts',
			haproxy => 'puppet:///modules/common/haproxy_hosts',
                        }
  	}	

	if $is_mysql {
        	file { "mysqld_safe":
                	ensure 	=> file,
                	path    => "/usr/bin/mysqld_safe",
                	mode    => 755,
                	source  => 'puppet:///modules/common/mysqld_safe',
        	}
		file { "innobackupex.sh":
			ensure	=> file,
			path	=> "/usr/home/pro/scripts/innobackupex.sh",
			mode	=> 755,
			source  => 'puppet:///modules/common/innobackupex.sh',
		}
		file { "online_schema_change.sh":
			ensure	=> file,
			path	=> "/usr/home/pro/scripts/online_schema_change.sh",
			mode	=> 755,
			source	=> "puppet:///modules/common/online_schema_change.sh"
		}
	}	

	file { "redis_backup_new.sh":
		ensure	=> file,
		path	=> "/usr/home/pro/scripts/redis_backup_new.sh",
		mode	=> 755,
		source 	=> "puppet:///modules/common/redis_backup_new.sh"
	}

	file { "nic_smp_affinity_set.sh":
		ensure	=> file,
		path	=> "/usr/home/pro/scripts/nic_smp_affinity_set.sh",
		mode	=> 755,
		source 	=> "puppet:///modules/common/nic_smp_affinity_set.sh"
	}

	file { "/etc/sysconfig/sysstat":
		ensure	=> file,
		path	=> '/etc/sysconfig/sysstat',
    		source	=> 'puppet:///modules/common/sysstat',
  	}	

	file { "/etc/puppet/puppet.conf":
		ensure	=> file,
		path	=> '/etc/puppet/puppet.conf',
    		source	=> 'puppet:///modules/common/puppet.conf',
  	}	

        file { "/etc/sudoers":
                ensure  => file,
                path    => '/etc/sudoers',
		mode   	=> 440,
                source  => $is_haproxy ? { 
			true	=> 'puppet:///modules/common/haproxy_sudoers',
			default	=> 'puppet:///modules/common/sudoers',
			},
        }

#	file { "/etc/hosts.allow":
#		ensure	=> file,
#		path	=> '/etc/hosts.allow',
#		mode	=> 644,
#		content	=> template("${module_name}/hosts.allow.erb"),
#	}
#
#	file { "/etc/hosts.deny":
#		ensure	=> file,
#		path	=> '/etc/hosts.deny',
#		mode	=> 644,
#		content	=> template("${module_name}/hosts.deny.erb"),
#	}
	
	file { "puppet_clientbucket.sh":
		ensure 	=> file,
		path	=> "/usr/home/pro/scripts/puppet_clientbucket.sh",
		mode	=> 755,
		source	=> "puppet:///modules/common/puppet_clientbucket.sh",
	}

	exec { 'find /var/lib/puppet/clientbucket -name paths -execdir cat {} \; -execdir pwd \; -execdir date -r {} +"%F %T" \; -exec echo \; > /var/log/puppet/clientbucket.log':
		path    => "/bin:/usr/bin",
		user	=> root,
		timeout	=> 30,
	}
}
