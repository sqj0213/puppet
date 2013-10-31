define redis_single::service_masterslave(
        $port = '6579',
        $config_loglevel = 'notice',
        $config_timeout = '300',
        $ensure = 'running',
        $maxmemory = '8',
        $masterip = '127.0.0.1'
) {
        if $ipaddress_em2==$masterip{
                $is_master = true
        }else{
                $is_master = false
        }
        redis_single::config{"redis_single::config_$port":
                port            =>$port,
                is_master       =>$is_master,
                masterip        =>$masterip,
                maxmemory       =>$maxmemory,
                ipaddress       =>$ipaddress_em2,
        }
        redis_single::service{"ms_service_${port}":
                port            =>$port,
                ensure          =>$ensure,
        }
}
