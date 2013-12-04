# Install mod_wsgi

class apache::mod_wsgi {

  include apache
  include apache::config
  include homebrew
  include python

  # First fix a missing link which breaks compilation
  # See here for more info: https://github.com/Homebrew/homebrew-apache#troubleshooting
  file { "/Applications/Xcode.app/Contents/Developer/Toolchains/OSX10.8.xctoolchain":
    ensure => link,
    target => "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain",
    before => Homebrew::Formula['mod_wsgi'],
  }

  homebrew::formula { 'mod_wsgi':
    source => 'puppet:///modules/apache/brews/mod_wsgi.rb',
  }

  package { 'boxen/brews/mod_wsgi':
    ensure  => '3.4',
    require => Class['python']
  }

  # Add config file to load module

  $module_path = "${homebrew::config::installdir}/Cellar/mod_wsgi/3.4/libexec/mod_wsgi.so"

  file { "${apache::config::configdir}/other/mod_wsgi.conf":
    content => template('apache/config/apache/mod_wsgi.conf.erb'),
    owner   => root,
    group   => wheel,
    mode    => 0644,
    notify  => Service['org.apache.httpd'],
  }

}