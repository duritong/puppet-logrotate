#######################################
# logrotate module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
#######################################


# modules_dir { "logrotate": }
class logrotate {
    include logrotate::base
}
class logrotate::base {
    package{logrotate:
        ensure => present,
    }

    file{"/etc/cron.daily/logrotate":
        source => [ "puppet://$server/logrotate/logrotate.cron.daily.${operatingsystem}.${lsbdistrelease}",
                    "puppet://$server/logrotate/logrotate.cron.daily.${operatingsystem}",
                    "puppet://$server/logrotate/logrotate.cron.daily" ],
        require => Package[logrotate],
        owner => root, group => 0, mode => 0755;
    }
}


