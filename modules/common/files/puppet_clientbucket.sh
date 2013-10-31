#!/bin/sh

find /var/lib/puppet/clientbucket -name paths -execdir cat {} \; -execdir pwd \; -execdir date -r {} +"%F %T" \; -exec echo \; > /var/log/puppet/clientbucket.log
