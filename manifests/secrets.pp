# This class can be used install secrets components.
#
# @example when declaring the secrets class
#  class { '::profiles::secrets': }
#
# @param vault Manage Hashicorp's Vault on this node.
class profiles::secrets (
  Boolean $vault = false,
){
  if $vault {
    class { '::profiles::secrets::vault': }
  }
}
