# manifests/pbp.pp
# manages our logrotate setup
class logrotate::pbp inherits logrotate::base {
  # fix that for our tmp_tmp hack
  if $::tmp_device {
    file{'/var/roottmp':
      ensure => directory,
      owner  => root,
      group  => 0,
      mode   => '0750';
    }

    File['/etc/cron.daily/logrotate']{
      source => [ "puppet:///modules/logrotate/tmptmp/logrotate.cron.daily.${::operatingsystem}.${::operatingsystemmajrelease}",
                  "puppet:///modules/logrotate/tmptmp/logrotate.cron.daily.${::operatingsystem}",
                  'puppet:///modules/logrotate/tmptmp/logrotate.cron.daily' ],
      require +> File['/var/roottmp'],
    }
  }
}
