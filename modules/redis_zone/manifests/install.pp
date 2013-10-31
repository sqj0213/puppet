class redis_zone::install{
	package { "redis-server":
                name    =>'redis.x86_64',
                ensure  => installed,
		provider=> 'yum'
        }
        package {'python-redis':
                name    => 'python-redis.noarch',
                ensure  => installed,
		provider=> 'yum'
        }
}
