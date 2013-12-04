# A Boxen-focused Apache Vhost setup helper
#
# Options:
#
#     docroot =>
#       The directory to use as the document root.
#       Defaults to "${boxen::config::srcdir}/${name}".
#
#     port =>
#       Port for Apache to listen on. REQUIRED.
#

define apache::vhost(
  $port,
  $docroot  = undef,
  $host = undef,
) {
  include apache

  $vhost_docroot = $docroot ? {
    undef   => "${boxen::config::srcdir}/${name}",
    default => $docroot
  }

  $hostname = $host ? {
    undef   => "${name}.dev",
    default => $host
  }

  file { "${apache::config::sitesdir}/${name}.conf":
    content => template('apache/config/apache/vhost.conf.erb'),
    require => File[$apache::config::sitesdir],
    notify  => Service['org.apache.httpd'],
  }

}