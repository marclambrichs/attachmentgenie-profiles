# This class can be used to install powerdns components.
#
# @example when declaring the powerdns class
#  class { '::profiles::dns::powerdns': }
#
class profiles::dns::powerdns (
  Boolean $authoritative = true,
  Hash $auth_config = {},
  Enum['bind','ldap','mysql','postgresql','sqlite'] $backend = 'postgresql',
  Boolean $backend_install = false,
  Boolean $backend_create_tables = false,
  Optional[String] $custom_repo = undef,
  Optional[String] $db_password = undef,
  Optional[String] $db_root_password = undef,
  Boolean $recursor = false,
  Hash $recursor_config = {},
  String $version = '4.1'
) {
  class { '::powerdns':
    authoritative         => $authoritative,
    auth_config           => $auth_config,
    backend               => $backend,
    backend_install       => $backend_install,
    backend_create_tables => $backend_create_tables,
    custom_repo           => $custom_repo,
    db_password           => $db_password,
    db_root_password      => $db_root_password,
    recursor              => $recursor,
    recursor_config       => $recursor_config,
    version               => $version,
  }
}
