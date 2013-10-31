class haproxy::install(){
        package {'haproxy':
                ensure  => installed,
                provider=> 'yum',
#                source  => 'http://123.103.21.139/haproxy-1.4.22-3.el6.x86_64.rpm',
        }
}
