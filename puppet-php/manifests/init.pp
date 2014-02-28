# Class for PHP.

class php {

  include php::config

  file { $php::config::inifile:
    content => template('php/php.ini.erb'),
    group   => 'wheel',
    owner   => 'root',
    notify  => Service['org.apache.httpd'],
  }

}
