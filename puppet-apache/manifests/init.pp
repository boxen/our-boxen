class apache {

  include apache::config

  # Bring default plist under our control - taken from Mountain Lion 10.8.2

  file { '/System/Library/LaunchDaemons/org.apache.httpd.plist':
    content => template('apache/org.apache.httpd.plist.erb'),
    group   => 'wheel',
    notify  => Service['org.apache.httpd'],
    owner   => 'root'
  }

  # Use different configs for apache 2.4
  if $operatingsystemmajrelease >= 14 {
    $httpd_conf_template = 'apache/config/apache-2-4/httpd.conf.erb'
    $httpd_ssl_conf_template = 'apache/config/apache-2-4/httpd-ssl.conf.erb'
  } else {
    $httpd_conf_template = 'apache/config/apache/httpd.conf.erb'
    $httpd_ssl_conf_template = 'apache/config/apache/httpd-ssl.conf.erb'
  }

  # Add all the directories and files Apache is expecting
  # Most of these should already exist on Mountain Lion

  file { [
    $apache::config::configdir,
    $apache::config::logdir,
  ]:
    ensure => directory,
    owner  => root,
    group  => wheel,
  }

  file { [
    $apache::config::sitesdir,
    $apache::config::ssl_storage,
  ]:
    ensure => directory,
    owner  => $boxen_user,
    group  => staff,
  }

  file { $apache::config::configfile:
    content => template($httpd_conf_template),
    notify  => Service['org.apache.httpd'],
    owner   => root,
    group   => wheel
  }

  file { $apache::config::vhostsfile:
    content => template('apache/config/apache/httpd-vhosts.conf.erb'),
    notify  => Service['org.apache.httpd'],
    owner   => root,
    group   => wheel
  }

  file { $apache::config::ssl_file:
    content => template($httpd_ssl_conf_template),
    notify  => Service['org.apache.httpd'],
    owner   => root,
    group   => wheel
  }

  file { $apache::config::ssl_certificate_file:
    content => template('apache/ssl/dev.crt.erb'),
    notify  => Service['org.apache.httpd'],
    owner   => root,
    group   => wheel
  }

  file { $apache::config::ssl_certificate_key_file:
    content => template('apache/ssl/dev.key.erb'),
    notify  => Service['org.apache.httpd'],
    owner   => root,
    group   => wheel
  }

  service { "org.apache.httpd":
    ensure => running,
    require => File[$apache::config::configfile]
  }

}
