# This class can be used install logstash
#
# @example when declaring the logstash class
#  class { '::profiles::monitoring::logstash': }
#
# @param auto_upgrade      Install the latest version.
# @param config_files      Content for logstash input, filters and output.
# @param ensure            Present or absent.
# @param group             Logstash group.
# @param manage_repo       Setup repository to install logstash from.
# @param pipelines         Define array of pipelines.
# @param restart_on_change Restart the service whenever the configuration changes.
# @param user              Logstash user.
# @param version           Which version of logstash to install.
class profiles::monitoring::logstash (
  Boolean $auto_upgrade = false,
  Hash $config_files = {},
  Enum[absent,present] $ensure = present,
  String $group = 'logstash',
  Array $jvm_options = [],
  Boolean $manage_repo = false,
  Array $pipelines = [],
  Boolean $restart_on_change = false,
  String $user = 'logstash',
  String $version = '6.4'
){
  class { '::logstash':
    ensure            => $ensure,
    auto_upgrade      => $auto_upgrade,
    jvm_options       => $jvm_options,
    logstash_group    => $group,
    logstash_user     => $user,
    manage_repo       => $manage_repo,
    pipelines         => $pipelines,
    restart_on_change => $restart_on_change,
    version           => $version,
  }

  create_resources(::logstash::configfile, $config_files)
}
