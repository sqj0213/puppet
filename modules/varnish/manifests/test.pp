define varnish::test(
	$port=6081,
	$backends=[ {name=>'gximg1',ip=>'172.16.3.10',port=>'8080'} ])
{
	file{"test":
		ensure  => file,
                path    => "/etc/varnish/test.vcl",
		content => template("${module_name}/test1.erb"),
                mode    => 0644,
                group   => 'root',
                owner   => 'root'
	}
}
