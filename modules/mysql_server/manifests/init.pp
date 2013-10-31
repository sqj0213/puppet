define mysql_server::percona(
	$port=3306,
	$ensure='stopped',
	$type='master',
	$innodb_buffer_pool_size='8G',
	$max_connections=4096,
	$max_heap_table_size='64M',
	$read_buffer_size='32M',
	$read_rnd_buffer_size='16M',
	$sort_buffer_size='32M',
	$join_buffer_size='8M',
	$query_cache_size='512M',
	$key_buffer_size='32M',
	$innodb_flush_log_at_trx_commit=1,
	$innodb_buffer_pool_instances=2) {
#	include mysql_server::install
	mysql_server::service{ "service_$port":
		port	  			=> "$port",
		ensure	  			=> "$ensure",
		type 				=> "$type",
		innodb_buffer_pool_size		=> "$innodb_buffer_pool_size",
		max_connections			=> "$max_connections",
		max_heap_table_size		=> "$max_heap_table_size",
		read_buffer_size		=> "$read_buffer_size",
		read_rnd_buffer_size		=> "$read_rnd_buffer_size",
		sort_buffer_size		=> "$sort_buffer_size",
		join_buffer_size		=> "$join_buffer_size",
		query_cache_size		=> "$query_cache_size",
		key_buffer_size			=> "$key_buffer_size",
		innodb_flush_log_at_trx_commit	=> "$innodb_flush_log_at_trx_commit",
		innodb_buffer_pool_instances 	=> "$innodb_buffer_pool_instances",
	}
}
