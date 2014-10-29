# Class for PHP.

class php {

  include php::config
  
  exec { "tap php":
    command => "brew tap homebrew/php",
    creates => "${boxen::config::home}/homebrew/Library/Taps/homebrew/homebrew-php",
    require => Class["homebrew"],
  }
  
  exec { "tap dupes":
    command => "brew tap homebrew/dupes",
    creates => "${boxen::config::home}/homebrew/Library/Taps/homebrew/homebrew-dupes",
    require => Class["homebrew"],
  }
  
  package { "php53":
    ensure => present,
    require => [
      Exec['tap php'],
      Exec['tap dupes'],
    ],
    install_options => '--with-zlib-dir=/usr/include',
  }  
  
  package { "php53-mongo":
    ensure => present,
    require => Package['php53'],
    install_options => '--with-zlib-dir=/usr/include',
    notify  => Service['org.apache.httpd'],
  }
  
  exec { "install imagick":
    command => 'touch $(brew --prefix php53)/lib/php/.lock && chmod 0644 $(brew --prefix php53)/lib/php/.lock && printf "/opt/boxen/homebrew/Cellar/imagemagick/6.8.9-1-boxen2/\n" | pecl install imagick',
    creates => '/opt/boxen/homebrew/Cellar/php53/5.3.29/lib/php/extensions/no-debug-non-zts-20090626/imagick.so',
    require => Class['imagemagick'],
    notify  => Service['org.apache.httpd'],
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
