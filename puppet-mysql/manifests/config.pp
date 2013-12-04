# Internal: Prepare your system for MySQL.
#
# Examples
#
#   include mysql::config
class mysql::config(
  $port       = 3306
) {
  require boxen::config

  $configdir  = "${boxen::config::configdir}/mysql"
  $configfile = "${configdir}/my.cnf"
  $datadir    = "${boxen::config::datadir}/mysql"
  $executable = "${boxen::config::homebrewdir}/bin/mysqld_safe"
  $logdir     = "${boxen::config::logdir}/mysql"
  $logerror   = "${logdir}/error.log"
  $socket     = "${datadir}/socket"
}
