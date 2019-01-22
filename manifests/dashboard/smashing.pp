# This class can be used install a smashing dashboard
#
# @example when declaring the smashing class
#  class { '::profiles::dashboard::smashing': }
#
# @param provider   Package provider
# @param system_rubies
# @param system_users
# @param rvm_gems
class profiles::dashboard::smashing (
  String $provider = 'gem',
  Hash $system_rubies = {},
  Array $system_users = [],
  Hash $rvm_gems = {}, 
){

  if $provider == 'gem' {
    include '::gnupg'
  
    gnupg_key { 'pool.sks-keyservers.net':
      ensure     => present,
      key_id     => '39499BDB',
      user       => 'root',
      key_server => 'hkp://pool.sks-keyservers.net',
      key_type   => 'public',
    }
  
    class { '::rvm': 
      system_rubies => $system_rubies,
      system_users  => $system_users,
      rvm_gems      => $rvm_gems,
    }
  }

  package { 'smashing' :
    ensure   => installed,
    provider => $provider,
  }
}
