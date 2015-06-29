class oddhill::implementation::lamp {
  include apache
  include php::5_4_29
  include php::composer
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

  class { 'php::global':
    version => '5.4.29'
  }

  php::extension::mcrypt { "mcrypt for 5.4.29":
  	php => '5.4.29'
  }

  php::extension::mongo { "mongo for 5.4.29":
  	php => '5.4.29'
  }

  php::extension::imagick { "imagick for 5.4.29":
    php => '5.4.29',
    version => '3.1.2'
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
