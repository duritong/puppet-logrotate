class logrotate::base {
    package{logrotate:
        ensure => present,
    }

    file{"/etc/cron.daily/logrotate":
        source => [ "puppet:///modules/site-logrotate/${fqdn}/logrotate.cron.daily",
                    "puppet:///modules/logrotate/logrotate.cron.daily.${operatingsystem}.${lsbdistcodename}",
                    "puppet:///modules/logrotate/logrotate.cron.daily.${operatingsystem}",
                    "puppet:///modules/logrotate/logrotate.cron.daily" ],
        require => Package[logrotate],
        owner => root, group => 0, mode => 0755;
    }
}
