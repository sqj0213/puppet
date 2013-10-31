class mysql_server::install{
        #package {'percona-release':
        #        name    => 'percona-release',
        #        ensure  =>'installed',
        #        provider=>'rpm',
        #        source  => 'puppet:///modules/files/percona-release-0.0-1.x86_64.rpm',
        #}
        package {'Percona-Server-server':
                name    => 'Percona-Server-server-55.x86_64',
                ensure  => 'installed',
                provider=> 'yum',
        }
        package {'Percona-Server-devel':
                name    => 'Percona-Server-devel-55.x86_64',
                ensure  => 'installed',
                provider=> 'yum',
        }
        package {'percona-xtrabackup':
                name    => 'percona-xtrabackup.x86_64',
                ensure  => 'installed',
                provider=> 'yum',
        }
        package {'percona-toolkit':
                name    => 'percona-toolkit.noarch',
                ensure  => 'installed',
                provider=> 'yum',
        }
        package {'Percona-Server-shared':
                name    => 'Percona-Server-shared-55.x86_64',
                ensure  => 'installed',
                provider=> 'yum',
        }
        package {'Percona-Server-shared-compat':
                name    => 'Percona-Server-shared-compat.x86_64',
                ensure  => 'installed',
                provider=> 'yum',
        }
        package {'perl-DBD-MySQL':
                name    => 'perl-DBD-MySQL-4.013-3.el6.x86_64',
                ensure  => 'installed',
                provider=> 'yum',
        }
}
