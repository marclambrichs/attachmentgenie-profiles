# This class can be used install R
#
# @example when declaring the R class
#  class { '::profiles::runtime::r': }
#
# @param packages List of packages to install
class profiles::runtime::r (
  Boolean $devel   = false,
  Hash $packages   = {},
  Hash $r_packages = {}
) {
  class { '::r':
    devel => $devel,
  }

  Package<| tag == 'do_a' |> -> R::Package<| tag == 'do_b' |>

  create_resources('package', $packages, { tag => 'do_a' })
  create_resources('r::package', $r_packages, { tag => 'do_b' })
}
