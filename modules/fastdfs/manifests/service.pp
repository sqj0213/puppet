class fastdfs::service {
	   service {"php-fpm":
                ensure          =>'running',
                name            =>'php-fpm',
                enable          => true,
                provider        => 'redhat',
                require		=> File["fastdfs_client.ini"] ,
                start           => "/etc/init.d/php-fpm start",
                stop            => "/etc/init.d/php-fpm stop",
                restart         => "/etc/init.d/php-fpm reload",
                status          => "/etc/init.d/php-fpm status",
        }
}
