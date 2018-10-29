# This class can be used install jenkins components.
#
# @example when declaring the jenkins class
#  class { '::profiles::jenkins': }
#
# @param config_hash     Config settings
# @param default_plugins Always install these plugins.
# @param lts             Install the lts version.
# @param manage_repo     Manage rpm repository.
# @param plugins         Plugins to install.
# @param purge_plugins   Remove unmanaged plugins.
class profiles::testing::jenkins (
  Hash $config_hash = { 'JENKINS_LISTEN_ADDRESS' => { 'value' => '127.0.0.1' }},
  Boolean $lts = true,
  Boolean $manage_repo = false,
  Hash $plugin_hash = {},
) {
  class { '::jenkins':
    config_hash        => $config_hash,
    configure_firewall => false,
    install_java       => false,
    lts                => $lts,
    plugin_hash        => $plugin_hash,
    repo               => $manage_repo,
  }
}
