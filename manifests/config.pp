# == Class soe_motd::config
#
# Full description of class soe_motd::config here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { 'soe_motd::config':
#    ntp_servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# Jacob Fleming-Gale jacob.fleming-gale@icesystems.com.au
#
# === Copyright
#
# Copyright 2013 ICE Systems Pty Ltd, unless otherwise noted.
#
class soe_motd::config {

  # example configuration
  file { '/etc/motd':
    ensure   => present,
    owner    => 'root',
    group    => 'root',
    mode     => '0644',
    content  => template("${module_name}/motd.erb"),
  }

}