define redis_single::redis($port=6579,$masterip='127.0.0.1',$maxmemory=8){
#	include redis_single::install
        redis_single::service_masterslave{ "redis_$port":
                port      => $port,
                masterip  => $masterip,
                maxmemory => $maxmemory,
       #         ensure    => $running_1
        }
}
