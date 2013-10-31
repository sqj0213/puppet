class redis_zone ($groupid = 0,$port=6479,$masterip='127.0.0.1',$maxmemory=10) {
	include redis_zone::install
	
        notify{"groupid_$groupid":}
        $running_1 = $groupid ? {
                1       => 'running',
                2       => 'stopped',
                undef   => 'stopped'
        }
        notify{"running_1_$running_1":}

        redis_zone::service_masterslave{ "redis_6479":
                port    => 6479,
                masterip=>'172.16.2.15',
		maxmemory=>10,
                ensure  => $running_1
        }
        redis_zone::service_masterslave{"redis_6481":
                port    => 6481,
                masterip=>'172.16.2.15',
		maxmemory=>6,
                ensure  => $running_1
        }
        redis_zone::service_masterslave{"redis_6483":
                port    => 6483,
                masterip=> '172.16.2.15', 
		maxmemory=>8,
                ensure  => $running_1
        }
        redis_zone::service_masterslave{"redis_6482":
                port    => 6482,
                masterip=> '172.16.2.15' ,
		maxmemory=>4,
                ensure  => $running_1
        }
        #如果是第二组redis，则以下定义的redis service运行
        #if $groupid == 1{
                #$running = 'stopped'
        #}elsif $groupid ==2{
        $running_2 = $groupid ? {
                2       => 'running',
                1       => 'stopped',
                undef   => 'stopped'
        }
        notify{"groupid2_$groupid":}
        notify{"running_2_$running_2":}

        redis_zone::service_masterslave{"redis_6480":
                port    => 6480,
                masterip=> '172.16.2.16',
		maxmemory=>12,
                ensure  => $running_2
        }

        redis_zone::service_masterslave{"redis_6484":
                port    => 6484,
                masterip=> '172.16.2.16' ,
		maxmemory=>4,
                ensure  => $running_2
        }
        redis_zone::service_masterslave{"redis_6488":
                port    => 6488,
                masterip=> '172.16.2.16' ,
		maxmemory=>6,
                ensure  => $running_2
        }

        $running_3 = $groupid ? {
                2       => 'running',
                1       => 'stopped',
                undef   => 'stopped'
        }
        redis_zone::service_standalone{"redis_6487":
                port    => 6487,
	#	maxmemory=>10,
                ensure  => $running_3
        }
        redis_zone::service_standalone{"redis_6485":
                port    => 6485,
	#	maxmemory=>10,
                ensure  => $running_3
        }
}
