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
  include drush

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

  exec {"drush-dl-registry-rebuild":
    command => "drush dl registry_rebuild",
    creates => "/Users/${::boxen_user}/.drush/registry_rebuild",
  }

  exec {"drush-dl-module-builder":
    cwd => "/Users/${::boxen_user}/.drush",
    command => "drush dl module_builder && drush cc drush",
    creates => "/Users/${::boxen_user}/.drush/module_builder",
  }
}
