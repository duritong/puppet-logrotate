#######################################
# logrotate module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
#######################################

class logrotate {
  case $::operatingsystem {
    default: { include logrotate::base }
  }
}
