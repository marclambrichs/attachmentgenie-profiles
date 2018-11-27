# This class can be used install vault components.
#
# @example when declaring the vault class
#  class { '::profiles::jenkins': }
#
# @param enable_ui
# @param install_method
# @param listener
# @param manage_storage_dir
# @param package_ensure
# @param purge_config_dir
# @param version
class profiles::secrets::vault (
  Boolean $enable_ui = false,
  Enum['archive','repo'] $install_method = 'repo',
  Variant[Hash, Array[Hash]] $listener = {},
  Boolean $manage_storage_dir = true,
  Enum['present','installed','absent','purged','held','latest'] $package_ensure = 'installed',
  Boolean $purge_config_dir = false,
  String $version = undef,
) {
  class { '::vault':
    enable_ui          => $enable_ui,
    install_method     => $install_method,
    listener           => $listener,
    manage_storage_dir => $manage_storage_dir,
    package_ensure     => $package_ensure,
    purge_config_dir   => $purge_config_dir,
    version            => $version,
  }
}
