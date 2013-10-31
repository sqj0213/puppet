class ganglia($type = 'default'){
	include ganglia::install
	include ganglia::service
	ganglia::config{'config':type => $type}
}
