# This class can be used install packer.
#
# @param   version   The version of Packer to install. 
# @param   bin_dir   The binary directory to place Packer in. 
# @param   cache_dir The directory to cache Packer release archives in.
# @param   base_url  The base download URL to retrieve Packer from. 
class profiles::testing::jenkins (
  String $version   = '1.3.4',
  String $bin_dir   = '/usr/local/bin',
  String $cache_dir = /usr/local/packer',
  String $base_url  = "https://releases.hashicorp.com/packer/',
) {
  class { '::packer':
   version   => $version,
   bin_dir   => $bin_dir,
   cache_dir => $cache_dir,
   base_url  => $base_url,
  }
}
