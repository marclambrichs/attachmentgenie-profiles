# This class can be used install filebeat
#
# @example when declaring the filebeat class
#  class { '::profiles::monitoring::filebeat': }
#
# @param modules
# @param outputs
# @param package_ensure
# @param prospectors
class profiles::monitoring::filebeat (
  Enum[absent,present] $ensure = present,
  Array $modules = [],
  Hash $outputs = {},
  Hash $prospectors = {},
){
  class { '::filebeat':
    modules        => $modules,
    outputs        => $outputs,
    package_ensure => $ensure,
    prospectors    => $prospectors,
  }
}
