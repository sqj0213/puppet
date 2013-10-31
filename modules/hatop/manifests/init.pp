class hatop(){
        file { "hatop.tar.gz":
                ensure  => file,
                path    => '/tmp/hatop-0.7.7.tar.gz',
                source  => 'puppet:///modules/hatop/hatop-0.7.7.tar.gz',
        }
	
	exec { "build-hatop":
		cwd	=> '/tmp',
		command	=> 'tar zxf hatop-0.7.7.tar.gz && cd hatop-0.7.7 && install -m 755 bin/hatop /usr/bin && install -m 644 man/hatop.1 /usr/local/share/man/man1 && gzip /usr/local/share/man/man1/hatop.1',
		path    => "/bin:/usr/bin",
		creates => "/usr/bin/hatop",
                user    => root,
                timeout => 30,
		require	=> File["hatop.tar.gz"],
	}
}
