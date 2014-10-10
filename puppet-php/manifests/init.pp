# Class for PHP.

class php {

  include php::config
  
  exec { "tap php":
    command => "brew tap homebrew/php",
    creates => "${boxen::config::home}/homebrew/Library/Taps/homebrew/homebrew-php",
  }
  
  exec { "tap dupes":
    command => "brew tap homebrew/dupes",
    creates => "${boxen::config::home}/homebrew/Library/Taps/homebrew/homebrew-dupes",
  }
  
  package { "php53":
    ensure => present,
    require => [
      Exec['tap php'],
      Exec['tap dupes'],
    ],
    install_options => '--with-zlib-dir=/usr/include',
  }  
  
  file { $php::config::log_dir:
    ensure => directory,
  }
  
  file { $php::config::inifile:
    content => template('php/php.ini.erb'),
    group   => 'wheel',
    owner   => 'root',
    notify  => Service['org.apache.httpd'],
    require => Package['php53'],
  }

}
