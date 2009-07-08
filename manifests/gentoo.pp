class logrotate::gentoo inherits logrotate::base {
    Package[logrotate]{
        category => 'app-admin',
    }
}
