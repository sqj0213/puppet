define haproxy::config($templateType){
	file {"/etc/haproxy/haproxy.cfg":
		content => $templateType? {
			bj_ha 	  => template("${module_name}/haproxy-global.cfg","${module_name}/haproxy-bj_ha.cfg.erb"),
			hz_ha 	  => template("${module_name}/haproxy-global.cfg","${module_name}/haproxy-hz_ha.cfg.erb"),
			ts_ha 	  => template("${module_name}/haproxy-global.cfg","${module_name}/haproxy-ts_ha.cfg.erb"),
			#bj_pic_ha => template("${module_name}/haproxy-bj_pic_ha.cfg.erb"),
			bj_pic_ha => template("${module_name}/haproxy-global-new.cfg","${module_name}/haproxy-bj_ha-new.cfg.erb"),
			hz_jic_ha => template("${module_name}/haproxy-hz_jic_ha.cfg.erb"),
			},
		mode   => 0644,
		owner  => "root",
		group  => "root",
		backup => '.bak',
	}
}
