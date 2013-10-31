# Beijing Redis Group 1
node 'aries-bj5.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{rsyslog:is_gearman_worker=>true,ip=>'172.16.1.14'}
        #class{redis:groupid=>1}
        #class{redis:port=>{[6383,6384,6385,6386]:},masterip=>'172.16.1.6'}
	class{common:hosts=>'bj'}
	class{mcollective:type=>'common'}
	class{logrotate:is_gearman_worker=>true}
}
node 'aries-bj7.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{rsyslog:is_gearman_worker=>true,ip=>'172.16.1.14'}
        #class{redis:groupid=>1}
        #class{redis:port=>{[6383,6384,6385,6386]:},masterip=>'172.16.1.6'}
	class{common:hosts=>'bj'}
	class{mcollective:type=>'common'}
	class{logrotate:is_gearman_worker=>true}
}

# Beijing Redis Group 2
node 'aries-bj4.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{rsyslog:is_gearman_worker=>true,ip=>'172.16.1.14'}
	redis_single::redis{'6579':port=>6579,masterip=>'172.16.2.4'}
        #class{redis:groupid=>2}
        #class{redis:port=>[6379,6380,6381,6382],masterip=>'172.16.1.5'}
	class{common:hosts=>'bj'}
	class{mcollective:type=>'common'}
	class{logrotate:is_gearman_worker=>true}
}
node 'aries-bj6.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{rsyslog:is_gearman_worker=>true,ip=>'172.16.1.14'}
	redis_single::redis{'6579':port=>6579,masterip=>'172.16.2.4'}
        #class{redis:groupid=>2}
        #class{redis:port=>[6379,6380,6381,6382],masterip=>'172.16.1.5'}
	class{common:hosts=>'bj'}
	class{mcollective:type=>'common'}
	class{logrotate:is_gearman_worker=>true}
}

# HuZhou Redis Group 1
node 'aries-hz7.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{logrotate:is_mysql=>true}
        mysql_server::percona{'3306':
                port                            => 3306,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '8M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '16M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        #class{redis_zone:groupid=>2}
        #class{redis:groupid=>1}
        #class{redis:port=>[6379,6380,6381,6382],masterip=>'172.16.1.5'}
	class{common:hosts=>'hz',is_mysql=>true}
	class{mcollective:type=>'common'}
}
node 'aries-hz9.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{logrotate:is_mysql=>true}
        #class{redis_zone:groupid=>1}
        #class{redis:groupid=>1}
        #class{redis:port=>[6379,6380,6381,6382],masterip=>'172.16.1.5'}
        mysql_server::percona{'3309':
                port                            => 3309,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '16M',
                join_buffer_size                => '2M',
                query_cache_size                => '32M',
                key_buffer_size                 => '3G',
                innodb_flush_log_at_trx_commit  => 0
        }
	class{common:hosts=>'hz',is_mysql=>true}
	class{mcollective:type=>'common'}
}

# HuZhou Redis Group 2
node 'aries-hz6.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{logrotate:is_mysql=>true}
	#redis_single::redis{'6579':port=>6579,masterip=>'172.16.2.4'}
        #class{redis:groupid=>2}
        #class{redis_zone:groupid=>1}
        #class{redis:port=>[6379,6380,6381,6382],masterip=>'172.16.1.5'}
        mysql_server::percona{'3307':
                port                            => 3307,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '3G',
                innodb_flush_log_at_trx_commit  => 0
        }
	class{common:hosts=>'hz',is_mysql=>true}
	class{mcollective:type=>'common'}
}
node 'aries-hz8.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{logrotate:is_mysql=>true}
	redis_single::redis{'6579':port=>6579,masterip=>'172.16.2.4'}
        mysql_server::percona{'3311':
                port                            => 3311,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '6G',
                innodb_flush_log_at_trx_commit  => 0
        }
        #class{redis_zone:groupid=>2}
        #class{redis:groupid=>2}
        #class{redis:port=>[6379,6380,6381,6382],masterip=>'172.16.1.5'}
	class{common:hosts=>'hz',is_mysql=>true}
	class{mcollective:type=>'common'}
}

# TangShan Redis Group 1
node 'aries-ts5.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{logrotate:is_mysql=>true}
        #class{redis_zone:groupid=>1}
        #class{redis:groupid=>1}
        #class{redis:port=>[6379,6380,6381,6382],masterip=>'172.16.1.5'}
        mysql_server::percona{'3310':
                port                            => 3310,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '6G',
                innodb_flush_log_at_trx_commit  => 0
        }
	class{common:hosts=>'ts',is_mysql=>true}
	class{mcollective:type=>'common'}
}
node 'aries-ts7.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{logrotate:is_mysql=>true}
        #class{redis_zone:groupid=>1}
        #class{redis:groupid=>1}
        #class{redis:port=>[6379,6380,6381,6382],masterip=>'172.16.1.5'}
        mysql_server::percona{'3306':
                port                            => 3306,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '8M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '16M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
	class{common:hosts=>'ts',is_mysql=>true}
	class{mcollective:type=>'common'}
}

# TangShan Redis Group 2
node 'aries-ts6.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{logrotate:is_mysql=>true}
	redis_single::redis{'6579':port=>6579,masterip=>'172.16.2.4'}
        #class{redis_zone:groupid=>2}
        #class{redis:groupid=>2}
        #class{redis:port=>[6379,6380,6381,6382],masterip=>'172.16.1.5'}
        mysql_server::percona{'3309':
                port                            => 3309,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '3G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '16M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '3G',
                innodb_flush_log_at_trx_commit  => 0
        }
	class{common:hosts=>'ts',is_mysql=>true}
	class{mcollective:type=>'common'}
}
node 'aries-ts8.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'redis'}
	class{sysctl:type=>'redis'}
	class{logrotate:is_mysql=>true}
	redis_single::redis{'6579':port=>6579,masterip=>'172.16.2.4'}
        mysql_server::percona{'3311':
                port                            => 3311,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        #class{redis_zone:groupid=>2}
        #class{redis:groupid=>2}
        #class{redis:port=>[6379,6380,6381,6382],masterip=>'172.16.1.5'}
	class{common:hosts=>'ts',is_mysql=>true}
	class{mcollective:type=>'common'}
}

# Beijing MySQL
node 'virgo-bj8.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{logrotate:is_gearman_worker=>true,is_mysql=>true}
	class{nrpe:type=>'mysql'}
	class{sysctl:type=>'mysql'}
	class{rsyslog:host=>'bj8',is_gearman_worker=>true,ip=>'172.16.1.14'}
        mysql_server::percona{'3306':
                port                            => 3306,
                ensure                          => 'running',
                type                            => 'master_candidate',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '8M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '16M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3307':
                port                            => 3307,
                ensure                          => 'running',
                type                            => 'master_candidate',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 128,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3309':
                port                            => 3309,
                ensure                          => 'running',
                type	                        => 'slave_myisam',
                innodb_buffer_pool_size         => '3G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '16M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '3G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3313':
                port                            => 3313,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '2G',
                innodb_flush_log_at_trx_commit  => 0
        }
	class{common:hosts=>'bj',is_mysql=>true}
	class{mcollective:type=>'common'}
}
node 'virgo-bj9.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'mysql'}
	class{sysctl:type=>'mysql'}
	class{logrotate:is_mysql=>true}
	class{rsyslog:host=>'bj9'}
        mysql_server::percona{'3306':
                port                            => 3306,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '8M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '16M',
                key_buffer_size                 => '8G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3307':
                port                            => 3307,
                ensure                          => 'running',
                type                            => 'master',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 256,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3311':
                port                            => 3311,
                ensure                          => 'running',
                type                            => 'master',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3312':
                port                            => 3312,
                ensure                          => 'running',
                type                            => 'master_candidate',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
        class{common:hosts=>'bj',is_mysql=>true}
	class{mcollective:type=>'common'}
}
node 'virgo-bj12.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'mysql'}
	class{sysctl:type=>'mysql'}
	class{logrotate:is_mysql=>true}
	class{rsyslog:host=>'bj12'}
        mysql_server::percona{'3306':
              	port                            => 3306,
                ensure                          => 'running',
                type                            => 'master',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '8M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '16M',
                innodb_flush_log_at_trx_commit  => 0
       	}
        mysql_server::percona{'3307':
                port                            => 3307,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 128,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '3G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3308':
                port                            => 3308,
                ensure                          => 'running',
                type                            => 'master',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3310':
                port                            => 3310,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '6G',
                innodb_flush_log_at_trx_commit  => 0
        }
        class{common:hosts=>'bj',is_mysql=>true}
	class{mcollective:type=>'common'}
}
node 'virgo-bj26.internal.gexing.com'{
	include user
	include ssh_server
	include monit
	class{nrpe:type=>'mysql'}
	class{sysctl:type=>'mysql'}
        mysql_server::percona{'3306':
                port                            => 3306,
                ensure                          => 'running',
                type                            => 'slave_innodb',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '8M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '16M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3307':
                port                            => 3307,
                ensure                          => 'running',
                type                            => 'master',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 128,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
#        mysql_server::percona{'3310':
#                port                            => 3310,
#                ensure                          => 'running',
#                type	                         => 'master',
#                innodb_buffer_pool_size         => '16G',
#                max_connections                 => 1024,
#                max_heap_table_size             => '8M',
#                read_buffer_size                => '4M',
#                read_rnd_buffer_size            => '4M',
#                sort_buffer_size                => '4M',
#                join_buffer_size                => '4M',
#                query_cache_size                => '32M',
#                innodb_flush_log_at_trx_commit  => 0
#        }
#        mysql_server::percona{'3309':
#                port                            => 3309,
#                ensure                          => 'running',
#                type	                        => 'master',
#                innodb_buffer_pool_size         => '8G',
#                max_connections                 => 128,
#                max_heap_table_size             => '16M',
#                read_buffer_size                => '4M',
#                read_rnd_buffer_size            => '4M',
#                sort_buffer_size                => '16M',
#                join_buffer_size                => '4M',
#                query_cache_size                => '32M',
#                key_buffer_size                 => '16M',
#                innodb_flush_log_at_trx_commit  => 0
#        }
        mysql_server::percona{'3311':
                port                            => 3311,
                ensure                          => 'running',
                type                            => 'master_candidate',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
#        mysql_server::percona{'3312':
#                port                            => 3312,
#                ensure                          => 'running',
#                type                            => 'master',
#                innodb_buffer_pool_size         => '8G',
#                max_connections                 => 1024,
#                max_heap_table_size             => '16M',
#                read_buffer_size                => '8M',
#                read_rnd_buffer_size            => '4M',
#                sort_buffer_size                => '4M',
#                join_buffer_size                => '4M',
#                query_cache_size                => '32M',
#                innodb_flush_log_at_trx_commit  => 0
#        }
	class{common:hosts=>'bj',is_mysql=>true}
	class{mcollective:type=>'common'}
}

node 'virgo-bj25.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'mysql'}
	class{sysctl:type=>'mysql'}
	class{logrotate:is_mysql=>true}
	class{rsyslog:host=>'bj25'}
        mysql_server::percona{'3310':
                port                            => 3310,
                ensure                          => 'running',
                type	                        => 'master',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3311':
                port                            => 3311,
                ensure                          => 'running',
                type	                        => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
	 	key_buffer_size	  	 	=> '6G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3312':
                port                            => 3312,
                ensure                          => 'running',
                type	                        => 'master',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3313':
                port                            => 3313,
                ensure                          => 'running',
                type                            => 'master_candidate',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
        class{common:hosts=>'bj',is_mysql=>true}
	class{mcollective:type=>'common'}
}

# HuZhou MySQL
node 'virgo-hz10.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'mysql'}
	class{sysctl:type=>'mysql'}
	class{logrotate:is_mysql=>true}
        class{nginx_1_4:port=>8080,ensure=>'running',area=>'hz'}
	squid::fuck{'squid8002':
		port	=> 8002,
		datapath=>'/data/squid_8002',
		ensure=>'running',
		cache_mem=>4096
	}
        mysql_server::percona{'3306':
                port                            => 3306,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '8M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '16M',
                key_buffer_size                 => '8G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3308':
                port                            => 3308,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3309':
                port                            => 3309,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '3G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '16M',
                join_buffer_size                => '2M',
                query_cache_size                => '32M',
                key_buffer_size                 => '6G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3310':
                port                            => 3310,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '6G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3312':
                port                            => 3312,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
		key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3313':
                port                            => 3313,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '2G',
                innodb_flush_log_at_trx_commit  => 0
        }
	class{common:hosts=>'hz',is_mysql=>true}
	class{mcollective:type=>'common'}
}
node 'virgo-hz11.internal.gexing.com'{
        include user
        include ssh_server
	include monit
        class{nrpe:type=>'mysql'}
	class{sysctl:type=>'mysql'}
	class{logrotate:is_mysql=>true}
        class{nginx_1_4:port=>8080,ensure=>'running',area=>'hz'}
        squid::fuck{'squid8002':
                port    => 8002,
                datapath=>'/data/squid_8002',
                ensure=>'running',
                cache_mem=>4096
        }

        mysql_server::percona{'3307':
                port                            => 3307,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3308':
                port                            => 3308,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3310':
                port                            => 3310,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '6G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3311':
                port                            => 3311,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '6G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3312':
                port                            => 3312,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3313':
                port                            => 3313,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '2G',
                innodb_flush_log_at_trx_commit  => 0
        }
        class{common:hosts=>'hz',is_mysql=>true}
	class{mcollective:type=>'common'}
}

# TangShan MySQL
node 'virgo-ts9.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'mysql'}
	class{sysctl:type=>'mysql'}
	class{logrotate:is_mysql=>true}
	class{common:hosts=>'ts',is_mysql=>true}
	class{mcollective:type=>'common'}
	class{nginx_1_4:port=>8080,ensure=>'running',area=>'ts'}
        squid::fuck{'squid8002':
                port    => 8002,
                datapath=>'/data/squid_8002',
                ensure=>'running',
                cache_mem=>1024,
        }

        mysql_server::percona{'3306':
                port                            => 3306,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '8M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '16M',
                key_buffer_size                 => '8G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3307':
                port                            => 3307,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3308':
                port                            => 3308,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3310':
                port                            => 3310,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '6G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3312':
                port                            => 3312,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3313':
                port                            => 3313,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '2G',
                innodb_flush_log_at_trx_commit  => 0
        }
}
node 'virgo-ts10.internal.gexing.com'{
        include user
        include ssh_server
	include monit
        class{nrpe:type=>'mysql'}
	class{sysctl:type=>'mysql'}
	class{logrotate:is_mysql=>true}
        class{common:hosts=>'ts',is_mysql=>true}
	class{mcollective:type=>'common'}
	class{nginx_1_4:port=>8080,ensure=>'running',area=>'ts'}
        squid::fuck{'squid8002':
                port    => 8002,
                datapath=>'/data/squid_8002',
                ensure=>'running',
                cache_mem=>1024,
        }
        mysql_server::percona{'3307':
                port                            => 3307,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3308':
                port                            => 3308,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3309':
                port                            => 3309,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '3G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '16M',
                join_buffer_size                => '2M',
                query_cache_size                => '32M',
                key_buffer_size                 => '6G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3311':
                port                            => 3311,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '6G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3312':
                port                            => 3312,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '4G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3313':
                port                            => 3313,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '2G',
                innodb_flush_log_at_trx_commit  => 0
        }
}

# HuZhou Nginx and PHP-FPM 
node 'cancer-hz12.internal.gexing.com',
        'cancer-hz13.internal.gexing.com',
        'cancer-hz20',
	'cancer-hz21.internal.gexing.com',
        'cancer-hz5.internal.gexing.com'{
        include user
        include ssh_server
	include rsync
	class{monit:type=>'web'}
	class{sysctl:type=>'web'}
	class{ganglia:type=>'HZ_www'}
	class{nrpe:type=>'web',port=>80,area=>'hz'}
	class{nutcracker:type=>'hz'}
	class{rsyslog:ip=>'172.16.3.4',type=>'web'}
	class{php-fpm:session_save_path=>'/var/lib/php/session',session_save_handler=>'files'}
        class{nginx:port=>80,ensure=>'running'}
	class{common:hosts=>'hz'}
	#class{mcollective:type=>'common'}
	class{logrotate:is_nginx=>true,is_php=>true}
}
#node 'cancer-hz13.internal.gexing.com'{
#	mysql_server::percona{'3306':
#                port                            => 3306,
#                ensure                          => 'running',
#                type                            => 'slave_myisam',
#                innodb_buffer_pool_size         => '2G',
#                max_connections                 => 1024,
#                max_heap_table_size             => '16M',
#                read_buffer_size                => '4M',
#                read_rnd_buffer_size            => '8M',
#                sort_buffer_size                => '4M',
#                join_buffer_size                => '4M',
#                query_cache_size                => '16M',
#                key_buffer_size                 => '8G',
#                innodb_flush_log_at_trx_commit  => 0
#        }
#}
#node 'cancer-hz12.internal.gexing.com'{
#        include user
#        include ssh_server
#        include rsync
#        include ganglia
#}

node 'cancer-hz4.internal.gexing.com'{
        #include user
        include ssh_server
	include rsync
	#include monit
#        class{nginx:port=>80,ensure=>'running'}
#        class{common:hosts=>'hz'}
        class{ganglia:type=>'HZ_www'}
	class{mcollective:type=>'common'}
	class{nutcracker:type=>'hz'}
        class{haproxy:templateType=>'hz_ha'}
	class{monit:type=>'web'}
        #mysql_server::percona{'3313':
        #        port                            => 3313,
        #        ensure                          => 'running',
        #        type                            => 'slave_myisam',
        #        innodb_buffer_pool_size         => '100M',
        #        max_connections                 => 128,
        #        max_heap_table_size             => '4M',
        #        read_buffer_size                => '1M',
        #        read_rnd_buffer_size            => '1M',
        #        sort_buffer_size                => '1M',
        #        join_buffer_size                => '1M',
        #        query_cache_size                => '4M',
        #        key_buffer_size                 => '100M',
        #        innodb_flush_log_at_trx_commit  => 0
        #}
}

# TangShan Nginx and PHP-FPM
node 'cancer-ts4.internal.gexing.com'{
        include user
        include ssh_server
	include rsync
	class{monit:type=>'web'}
	class{sysctl:type=>'web'}
	class{ganglia:type=>'TS_www'}
	class{nrpe:type=>'web',port=>80,area=>'ts'}
	class{nutcracker:type=>'ts'}
	class{rsyslog:ip=>'172.16.5.12',type=>'web'}
	class{php-fpm:session_save_path=>'/var/lib/php/session',session_save_handler=>'files'}
        class{nginx:port=>80,ensure=>'running'}
	class{common:hosts=>'ts'}
	class{mcollective:type=>'common'}
	class{logrotate:is_nginx=>true,is_php=>true}
}

node 'cancer-ts12.internal.gexing.com'{
        include user
        include ssh_server
	include rsync
	class{monit:type=>'web'}
	class{sysctl:type=>'web'}
	class{ganglia:type=>'TS_www'}
	class{nrpe:type=>'web',port=>80,area=>'ts'}
	class{nutcracker:type=>'ts'}
	class{php-fpm:session_save_path=>'/var/lib/php/session',session_save_handler=>'files'}
        class{nginx:port=>80,ensure=>'running'}
        class{common:hosts=>'ts'}
	class{mcollective:type=>'common'}
	class{logrotate:is_nginx=>true,is_php=>true}
}

# bj-haproxy
node 'leo-bj2.internal.gexing.com',
        'leo-bj3.internal.gexing.com'{
        include user
	#include monit
	include hatop
	class{nrpe:type=>'ha_varnish'}
        class{ssh_server:port=>13466,root=>'no'}
	class{sysctl:type=>'haproxy'}
	#class{haproxy:templateType=>'bj_ha'}
        class{common:hosts=>'haproxy',is_haproxy=>true}
	class{mcollective:type=>'common'}
}

# ts-haproxy
node 'leo-ts2.internal.gexing.com',
	'leo-ts3.internal.gexing.com'{
        include user
	#include monit
	include hatop
	class{nrpe:type=>'ha_varnish'}
        class{ssh_server:port=>13466,root=>'no'}
	class{sysctl:type=>'haproxy'}
        class{haproxy:templateType=>'ts_ha'}
        class{common:hosts=>'haproxy',is_haproxy=>true}
	class{mcollective:type=>'common'}
	varnish::service{"varnish:test":
                port=>6081,
                backends=>[
                        {name=>'gximg1', ip=>'172.16.5.9', port=>'8080'},
                        {name=>'gximg2', ip=>'172.16.5.10', port=>'8080'},
                        ],
                mem_sieze=>36,
                ensure=>'running'
	}
}
node 'leo-ts11.internal.gexing.com'{
	include user
        include monit
        include hatop
        include ssh_server
        class{nrpe:type=>'ha_varnish'}
        class{sysctl:type=>'haproxy'}
        class{ganglia:type=>'TS_ha'}
        class{haproxy:templateType=>'ts_ha'}
        class{common:hosts=>'haproxy',is_haproxy=>true}
        class{mcollective:type=>'common'}
        varnish::service{"varnish:test":
                port=>6081,
                backends=>[
                        {name=>'gximg1', ip=>'172.16.5.9', port=>'8080'},
                        {name=>'gximg2', ip=>'172.16.5.10', port=>'8080'},
                        ],
                mem_sieze=>36,
                ensure=>'running'
        }
}

# hz-haproxy+cache
node 'leo-hz2.internal.gexing.com',
	'leo-hz3.internal.gexing.com'{
        include user
	#include monit
	include hatop
	class{nrpe:type=>'ha_varnish'}
        class{ssh_server:port=>13466,root=>'no'}
	class{sysctl:type=>'haproxy'}
        class{haproxy:templateType=>'hz_ha'}
        class{common:hosts=>'haproxy',is_haproxy=>true}
	class{mcollective:type=>'common'}
        varnish::service{"varnish:test":
                port=>6081,
                backends=>[
                        {name=>'gximg1', ip=>'172.16.3.10', port=>'8080'},
                        {name=>'gximg2', ip=>'172.16.3.11', port=>'8080'},
                        ],
                mem_sieze=>6,
                ensure=>'running'
                }
}
node 'leo-hz15.internal.gexing.com'{
        include user
	include monit
        include ssh_server
	include hatop
	class{nrpe:type=>'ha_varnish'}
	class{sysctl:type=>'haproxy'}
	class{ganglia:type=>'HZ_ha'}
        #class{nginx_1_4:port=>8080,ensure=>'running'}
	varnish::service{"varnish:test":
		port=>6081,
		backends=>[
			{name=>'gximg1', ip=>'172.16.3.10', port=>'8080'},
			{name=>'gximg2', ip=>'172.16.3.11', port=>'8080'},
			],
		mem_sieze=>36, 
		ensure=>'running'
		}
        class{haproxy:templateType=>'hz_ha'}
        class{common:hosts=>'haproxy'}
	#class{mcollective:type=>'common'}
}
node 'leo-hz14.internal.gexing.com'{
        include user
        include ssh_server
	include rsync
	include hatop
	class{monit:type=>'web'}
	class{ganglia:type=>'HZ_ha'}
	class{sysctl:type=>'haproxy'}
	class{nrpe:type=>'ha_varnish'}
        #class{nrpe:type=>'web',port=>8080,area=>'hz'}
        varnish::service{"varnish:test":
                port=>6081,
                backends=>[
                        {name=>'gximg1', ip=>'172.16.3.10', port=>'8080'},
                        {name=>'gximg2', ip=>'172.16.3.11', port=>'8080'},
                        ],
                mem_sieze=>36,
                ensure=>'running'
                }
	#class{rsyslog:ip=>'172.16.3.4',type=>'web'}
	#class{php-fpm:session_save_path=>'/var/lib/php/session',session_save_handler=>'files'}
        #class{nginx:port=>8080,ensure=>'running'}
	#class{logrotate:is_nginx=>true,is_php=>true}
        class{haproxy:templateType=>'hz_ha'}
	class{nutcracker:type=>'hz'}
        class{common:hosts=>'hz'}
	class{mcollective:type=>'common'}
}
node 'leo-hz18.internal.gexing.com',
	'leo-hz19.internal.gexing.com'{
	include user
	include monit
	include ssh_server
	include hatop
	class{nrpe:type=>'ha_varnish'}
	class{ganglia:type=>'HZ_ha'}
	class{sysctl:type=>'haproxy'}
        class{haproxy:templateType=>'hz_ha'}
        #class{nginx_1_4:port=>8080,ensure=>'stopped'}
	varnish::service{"varnish:test":
		port=>6081,
		backends=>[
			{name=>'gximg1', ip=>'172.16.3.10', port=>'8080'},
			{name=>'gximg2', ip=>'172.16.3.11', port=>'8080'},
			],
		mem_sieze=>36, 
		ensure=>'running'
		}
	class{common:hosts=>'haproxy'}
	#class{mcollective:type=>'common'}
}

# BJ-SSO
node 'pisces-bj17',
        'pisces-bj18.internal.gexing.com'{
        include user
        include ssh_server
	include rsync
	class{monit:type=>'web'}
	class{nutcracker:type=>'bj'}
	class{ganglia:type=>'BJ_www'}
	class{nrpe:type=>'web',port=>80,area=>'bj'}
	class{rsyslog:ip=>'172.16.1.14',type=>'sso',is_gearman_worker=>true}
	class{php-fpm:session_save_path=>'tcp://172.16.1.4:6387',session_save_handler=>'redis',fpm_save_path=>'no'}
        class{nginx:server=>'bjweb',ensure=>'running'}
	class{logrotate:is_gearman_worker=>true,is_nginx=>true,is_php=>true}
	class{common:hosts=>'bj'}
	class{mcollective:type=>'common'}
}

# BJ-Manager
node 'libra-bj13.internal.gexing.com'{
	include user
	include ssh_server
	class{monit:type=>'web'}
	class{sysctl:type=>'web'}
	class{nutcracker:type=>'bj'}
	class{ganglia:type=>'default'}
	class{common:hosts=>'bj'}
	class{php-fpm:session_save_path=>'/var/lib/php/session',session_save_handler=>'files',type=>'manage'}
	class{mcollective:type=>'common'}
}

# BJ-WWW
node 'cancer-bj23.internal.gexing.com',
        'cancer-bj24.internal.gexing.com'{
        include user
        include ssh_server
	include rsync
	include monit
	include logrotate
	include fastdfs
	class{rsyslog:ip=>'172.16.1.14',type=>'pic'}
	class{common:hosts=>'bj'}
	class{ganglia:type=>'BJ_www'}
	class{mcollective:type=>'common'}
	class{php-fpm:upload_max_filesize=>'5M'}
}

# BJ-Redis-Mysql for zone
node 'virgo-bj15.internal.gexing.com'{
	class{common:hosts=>'bj',is_mysql=>true}
	class{mcollective:type=>'common'}
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'mysql'}
	class{sysctl:type=>'mysql'}
	class{logrotate:is_mysql=>true}
	class{rsyslog:host=>'bj15'}
        #class{redis_zone:groupid=>1}
        mysql_server::percona{'3308':
                port                            => 3308,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '3G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3309':
                port                            => 3309,
                ensure                          => 'running',
                type                            => 'master',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '16M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '16M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3310':
                port                            => 3310,
                ensure                          => 'running',
                type                            => 'master_candidate',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '8M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3311':
                port                            => 3311,
                ensure                          => 'running',
                type                            => 'master_candidate',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
}
node 'virgo-bj16.internal.gexing.com'{
	class{common:hosts=>'bj',is_mysql=>true}
	class{mcollective:type=>'common'}
        include user
        include ssh_server
	include monit
	class{nrpe:type=>'mysql'}
	class{sysctl:type=>'mysql'}
	class{logrotate:is_mysql=>true}
	class{rsyslog:host=>'bj16'}
        mysql_server::percona{'3308':
                port                            => 3308,
                ensure                          => 'running',
                type                            => 'master_candidate',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '16M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '16M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3309':
                port                            => 3309,
                ensure                          => 'running',
                type                            => 'master_candidate',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '16M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                key_buffer_size                 => '16M',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3312':
                port                            => 3312,
                ensure                          => 'running',
                type                            => 'slave_myisam',
                innodb_buffer_pool_size         => '8G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '4M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '16M',
                key_buffer_size                 => '4G',
                innodb_flush_log_at_trx_commit  => 0
        }
        mysql_server::percona{'3313':
                port                            => 3313,
                ensure                          => 'running',
                type                            => 'master',
                innodb_buffer_pool_size         => '2G',
                max_connections                 => 1024,
                max_heap_table_size             => '16M',
                read_buffer_size                => '8M',
                read_rnd_buffer_size            => '4M',
                sort_buffer_size                => '4M',
                join_buffer_size                => '4M',
                query_cache_size                => '32M',
                innodb_flush_log_at_trx_commit  => 0
        }
}

# BJ-FILE
node 'taurus-bj10.internal.gexing.com',
        'taurus-bj11.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	include fastdfs
	class{common:hosts=>'bj'}
	class{ganglia:type=>'storage'}
        class{nginx:server=>'old_storage',ensure=>'running'}
	class{rsyslog:ip=>'172.16.2.14',type=>'storage'}
	class{mcollective:type=>'common'}
}
node 'taurus-bj19.internal.gexing.com',
	'taurus-bj20.internal.gexing.com'{
	include user
	include ssh_server
	include monit
	include fastdfs
	#include logrotate
	class{common:hosts=>'bj'}
	class{ganglia:type=>'storage'}
	class{mcollective:type=>'common'}
	class{rsyslog:ip=>'172.16.1.14',type=>'fastdfs'}
        class{nginx:server=>'new_storage',ensure=>'running'}
	#class{php-fpm:session_save_path=>'/var/lib/php/session',session_save_handler=>'files'}
}

# HZ and TS varnish&&Nginx&&PHP-FPM
node 'cancer-ts13.internal.gexing.com'{
        include user
        include ssh_server
	include rsync
	class{monit:type=>'web'}
	class{sysctl:type=>'haproxy'}
	class{nrpe:type=>'web',port=>8080,ip=>'60.2.235.72',area=>'ts'}
	class{nutcracker:type=>'ts'}
	class{ganglia:type=>'TS_www'}
	class{rsyslog:ip=>'172.16.5.12',type=>'web'}
	class{php-fpm:session_save_path=>'/var/lib/php/session',session_save_handler=>'files'}
        class{nginx:port=>8080,ensure=>'running'}
	class{common:hosts=>'ts'}
	class{mcollective:type=>'common'}
	class{logrotate:is_nginx=>true,is_php=>true}
}
node 'cancer-ts14.internal.gexing.com'{
        class{common:hosts=>'ts'}
	class{mcollective:type=>'common'}
        include user
        include ssh_server
        include rsync
	class{monit:type=>'web'}
	class{sysctl:type=>'haproxy'}
        class{nrpe:type=>'web',port=>8080,ip=>'60.2.235.73',area=>'ts'}
        class{nutcracker:type=>'ts'}
	class{ganglia:type=>'TS_www'}
        class{rsyslog:ip=>'172.16.5.12',type=>'web'}
        class{php-fpm:session_save_path=>'/var/lib/php/session',session_save_handler=>'files'}
        class{nginx:port=>8080,ensure=>'running'}
	class{logrotate:is_nginx=>true,is_php=>true}
}

# BJ Haproxy+Keepalived+Squid server
node 'leo-bj21.internal.gexing.com'{
        include user
        include ssh_server
	include monit
	include hatop
	class{nrpe:type=>'ha_varnish'}
	class{sysctl:type=>'haproxy'}
	class{ganglia:type=>'BJ_ha'}
	class{rsyslog:is_gearman_worker=>true,ip=>'172.16.1.14'}
        class{haproxy:templateType=>'bj_pic_ha'}
	class{common:hosts=>'bj'}
	class{mcollective:type=>'common'}
	class{logrotate:is_gearman_worker=>true}
        squid::fuck{'squid8002':
                port    	=> 8002,
                datapath	=>'/data/squid_8002',
                ensure		=>'running',
                cache_mem	=>30720,
		type		=>'bj',
		ip		=>'172.16.2.22'
        }
#	squid::fuck{'squid9002':
#                port            => 9002,
#                datapath        =>'/data/squid_9002',
#                ensure          =>'running',
#                cache_mem       =>1024,
#                type            =>'bj_new'
#        }
}
node 'leo-bj22.internal.gexing.com'{
        include user
        include ssh_server
        include monit
        include hatop
        class{nrpe:type=>'ha_varnish'}
        class{sysctl:type=>'haproxy'}
	class{ganglia:type=>'BJ_ha'}
        class{rsyslog:is_gearman_worker=>true,ip=>'172.16.1.14'}
        class{haproxy:templateType=>'bj_pic_ha'}
        class{common:hosts=>'bj'}
        class{mcollective:type=>'common'}
        class{logrotate:is_gearman_worker=>true}
        squid::fuck{'squid8002':
                port            => 8002,
                datapath        =>'/data/squid_8002',
                ensure          =>'running',
                cache_mem       =>30720,
                type            =>'bj',
                ip              =>'172.16.2.21'
        }
#        squid::fuck{'squid9002':
#                port            => 9002,
#                datapath        =>'/data/squid_9002',
#                ensure          =>'running',
#                cache_mem       =>1024,
#                type            =>'bj_new'
#        }
}

# HZ Nginx+Php-fpm+Redis_6487 server
node 'cancer-hz16.internal.gexing.com'{
        include user
        include ssh_server
	include rsync
	class{monit:type=>'web'}
	class{sysctl:type=>'haproxy'}
        class{nrpe:type=>'web',port=>8080,ip=>'122.225.115.204',area=>'hz'}
	class{nutcracker:type=>'hz'}
	class{rsyslog:ip=>'172.16.3.4',type=>'web'}
	class{php-fpm:session_save_path=>'/var/lib/php/session',session_save_handler=>'files'}
        class{nginx:port=>8080,ensure=>'running'}
        #class{redis_zone:groupid=>2}
	class{common:hosts=>'hz'}
	class{ganglia:type=>'HZ_www'}
	class{mcollective:type=>'common'}
	class{logrotate:is_nginx=>true,is_php=>true}
}
node 'cancer-hz17.internal.gexing.com'{
        include user
        include ssh_server
        include rsync
	class{monit:type=>'web'}
	class{sysctl:type=>'haproxy'}
        class{nrpe:type=>'web',port=>8080,ip=>'122.225.115.205',area=>'hz'}
	class{ganglia:type=>'HZ_www'}
        class{nutcracker:type=>'hz'}
        class{rsyslog:ip=>'172.16.3.4',type=>'web'}
        class{php-fpm:session_save_path=>'/var/lib/php/session',session_save_handler=>'files'}
        class{nginx:port=>8080,ensure=>'running'}
        #class{redis_zone:groupid=>2}
        class{common:hosts=>'hz'}
	class{mcollective:type=>'common'}
	class{logrotate:is_nginx=>true,is_php=>true}
}

node 'scorpio-bd66.internal.gexing.com',
	'scorpio-bd69.internal.gexing.com'{
	include user
	include monit
	include ssh_server
#	class{common:hosts=>'hz'}
	class{mcollective:type=>'common'}
}
