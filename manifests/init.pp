#######################################
# logrotate module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
#######################################

class logrotate {
  case $::operatingsystem {
    gentoo: { include logroate::gentoo }
    default: { include logrotate::base }
  }
}
