define ganglia::config($type){
        file {"/etc/ganglia/gmond.conf":
                #content => template("${module_name}/ganglia-gmond.erb"),
                content => $type? {
                        default     => template("${module_name}/manage_gmond.erb"),
                        storage     => template("${module_name}/storage_gmond.erb"),
                        BJ_www     => template("${module_name}/BJ_www_gmond.erb"),
                        HZ_www     => template("${module_name}/HZ_www_gmond.erb"),
                        TS_www     => template("${module_name}/TS_www_gmond.erb"),
                        BJ_ha     => template("${module_name}/BJ_ha_gmond.erb"),
                        HZ_ha     => template("${module_name}/HZ_ha_gmond.erb"),
                        TS_ha     => template("${module_name}/TS_ha_gmond.erb"),
                        },
                mode    => 0644,
                owner   => "root",
                group   => "root",
                backup  => '.bak',
        }
}
