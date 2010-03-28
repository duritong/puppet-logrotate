class logrotate::base {
    package{logrotate:
        ensure => present,
    }

    file{"/etc/cron.daily/logrotate":
        source => [ "puppet://$server/modules/site-logrotate/${fqdn}/logrotate.cron.daily",
                    "puppet://$server/modules/logrotate/logrotate.cron.daily.${operatingsystem}.${lsbdistcodename}",
                    "puppet://$server/modules/logrotate/logrotate.cron.daily.${operatingsystem}",
                    "puppet://$server/modules/logrotate/logrotate.cron.daily" ],
        require => Package[logrotate],
        owner => root, group => 0, mode => 0755;
    }
}
