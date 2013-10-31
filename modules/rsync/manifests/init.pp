class rsync(){
	file { "/etc/rsyncd.conf":
		ensure	=> file,
		path	=> '/etc/rsyncd.conf',
    		source	=> 'puppet:///modules/rsync/rsyncd.conf',
  	}
}
