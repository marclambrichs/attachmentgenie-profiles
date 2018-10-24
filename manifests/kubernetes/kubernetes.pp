# This class can be used install kubernetes.
#
# @example when declaring the kubernetes class
#  class { '::profiles::kubernetes::kubernetes': }
#
# @param controller 
# @param worker
class profiles::kubernetes::kubernetes (
  Boolean $controller = false,
  Boolean $worker = false,
) {
    if $controller {
      class { 'kubernetes':
        controller => true,
      }
    }
    if $worker {
      class { 'kubernetes':
        worker => true,
      }
    }
}
