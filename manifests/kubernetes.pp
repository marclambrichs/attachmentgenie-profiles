# This class can be used install kubernetes components.
#
# @example when declaring the kubernetes class
#  class { '::profiles::kubernetes': }
#
# @param kubernetes Manage kubernetes on this node
class profiles::kubernetes (
  Boolean $kubernetes = false,
) {
  if $kubernetes {
    class { '::profiles::kubernetes::kubernetes': }
  }
}
