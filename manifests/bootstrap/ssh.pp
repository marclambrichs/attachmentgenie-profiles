# This class can be used install ssh components.
#
# @example when declaring the ssh class
#  class { '::profiles::bootstrap::ssh': }
#
# @param config_entries                   Hash of config entries for a specific user's ~/.ssh/config.
# @param permit_root_login                Allow root login.
# @param ssh_config_forward_agent         Forward the connection of the agent to the remote machine.
# @param sshd_config_allowagentforwarding Allow forwarding of the agent.
# @param sshd_config_match                Hash for matches with nested arrays for options for the Match directive for the SSH daemon.
# @param sshd_config_port                 Port to bind to.
# @param sshd_password_authentication     Accept access using password.
class profiles::bootstrap::ssh (
  Hash $config_entries = {},
  String $permit_root_login = 'no',
  String $ssh_config_forward_agent = 'no',
  String $sshd_config_allowagentforwarding = 'no',
  Hash $sshd_config_match = {},
  String $sshd_config_port = '22',
  String $sshd_password_authentication = 'no'
) {
  class { '::ssh':
    config_entries                   => $config_entries,
    permit_root_login                => $permit_root_login,
    ssh_config_forward_agent         => $ssh_config_forward_agent,
    sshd_config_allowagentforwarding => $sshd_config_allowagentforwarding,
    sshd_config_match                => $sshd_config_match,
    sshd_config_port                 => $sshd_config_port,
    sshd_password_authentication     => $sshd_password_authentication,
  }
}
