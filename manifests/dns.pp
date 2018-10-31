# This class can be used to install DNS.
#
# @example when declaring the dns class
#  class { '::profiles::dns': }
#
# @param powerdns Manage powerdns on this node.
class profiles::dns (
  Boolean $powerdns = false,
) {
  if $powerdns {
    class { '::profiles::dns::powerdns': }
  }
}
