# basic setup of logrotate
class logrotate::base {
  package{'logrotate':
    ensure => present,
  }
}
