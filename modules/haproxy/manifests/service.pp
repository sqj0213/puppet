class haproxy::service {
	service {"haproxy":
		ensure 	=> running,
		enable	=> true,
		hasrestart => true,
		hasstatus  => true,
#		subscribe  => [Class[haproxy::config]]
	}
}
