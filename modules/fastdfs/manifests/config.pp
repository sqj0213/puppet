class fastdfs::config {
        file { "nginx_fdfs_conf":
                ensure  => file,
                path    => "/etc/fdfs/mod_fastdfs.conf",
                source  => 'puppet:///modules/fastdfs/mod_fastdfs.conf',
                mode    => 0644,
                group   => 'root',
                owner   => 'root'
        }
        file { "fastdfs_client.ini":
                ensure  => file,
                path    => "/etc/php.d/fastdfs_client.ini",
                source  => 'puppet:///modules/fastdfs/fastdfs_client.ini',
                mode    => 0644,
                group   => 'root',
                owner   => 'root'
        }
        file { "fastdfs_G_conf":
                ensure  => file,
                path    => "/etc/fdfs/client-G.conf",
                source  => 'puppet:///modules/fastdfs/client-G.conf',
                mode    => 0644,
                group   => 'root',
                owner   => 'root'
        }
        file { "fastdfs_S_conf":
                ensure  => file,
                path    => "/etc/fdfs/client-S.conf",
                source  => 'puppet:///modules/fastdfs/client-S.conf',
                mode    => 0644,
                group   => 'root',
                owner   => 'root'
        }
}
