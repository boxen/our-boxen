class oddhill::implementation::lamp {
  include apache
  include wget
  include autoconf
  include libtool
  include pcre
  include libpng
  include imagemagick
  include mysql
  include solr
  include java
  include postfix

  homebrew::tap { 'homebrew/php':
    before => Package['drush']
  }

  # Install php
  $php_version = '5.4.41'

  php::version { $php_version:
    ensure => present
  }

  include php::composer

  class { 'php::global':
    version => $php_version
  }

  php::extension::mcrypt { "mcrypt for {$php_version}":
  	php => $php_version,
    require => Php::Version[$php_version]
  }

  php::extension::mongo { "mongo for {$php_version}":
  	php => $php_version,
    require => Php::Version[$php_version]
  }

  php::extension::imagick { "imagick for {$php_version}":
    php => $php_version,
    version => '3.1.2',
    require => Php::Version[$php_version]
  }

  # Install drush
  class { 'drush':
    version => '7.0.0'
  }

  drush::plugin {'drush-registry-rebuild':
    name => 'registry_rebuild'
  }

  drush::plugin {'drush-module-builder':
    name => 'module_builder'
  }
}
