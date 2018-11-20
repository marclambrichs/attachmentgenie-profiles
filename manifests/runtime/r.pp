# This class can be used install R
#
# @example when declaring the R class
#  class { '::profiles::runtime::r': }
#
# @param packages List of packages to install
class profiles::runtime::r (
  Hash $packages   = {},
  Hash $r_packages = {},
) {
  class { '::r': }

  create_resources('package', $packages)
  create_resources('r::package', $r_packages)
}
