class apache::config {

  include boxen::config

  $configdir  = "/etc/apache2"
  $configfile = "${configdir}/httpd.conf"
  $vhostsfile = "${configdir}/extra/httpd-vhosts.conf"
  $sitesdir   = "/Users/$::boxen_user/Sites"

  $executable = "/usr/sbin/httpd"

  $logdir     = "${boxen::config::logdir}/apache"
  $logerror   = "${logdir}/error.log"

  $port = '80'

  $ssl_port = '443'
  $ssl_file = "${configdir}/extra/httpd-ssl.conf"
  $ssl_storage = "${boxen::config::datadir}/ssl"
  $ssl_certificate_file = "${ssl_storage}/dev.crt"
  $ssl_certificate_key_file = "${ssl_storage}/dev.key"

}
