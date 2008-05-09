# manifests/selinux.pp

class logrotate::selinux {
    case $operatingsystem {
        gentoo: { include logrotate::selinux::gentoo }
        default: { info("No selinux stuff yet defined for your operatingsystem") }
    }
}

class logrotate::selinux::gentoo {
    package{'selinux-logrotate':
        ensure => present,
        category => 'sec-policy',
        require => Package[logrotate],
    }
    selinux::loadmodule {"logrotate": require => Package[selinux-logrotate] }
}
