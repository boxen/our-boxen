require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub

  # node versions
  nodejs::version { 'v0.10': }
  nodejs::version { 'v0.12.0': }

  # default ruby versions
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }
  ruby::version { '2.1.1': }
  ruby::version { '2.1.2': }

  class { 'ruby::global':
    version => '2.1.1'
  }
  ruby_gem { 'sass':
    gem     => 'sass',
    ruby_version    => '2.1.1'
  }
  ruby_gem { 'compass':
    gem     => 'compass',
    ruby_version    => '2.1.1'
  }

  class { 'nodejs::global':
    version => 'v0.12.0'
  }
  nodejs::module { 'grunt-cli':
    node_version => 'v0.12.0'
  }
  nodejs::module { 'bower':
    node_version => 'v0.12.0'
  }
  nodejs::module { 'yo':
    node_version => 'v0.12.0'
  }
  nodejs::module { 'jshint':
    node_version => 'v0.12.0'
  }

  include apache
  include php
  include mysql
  include drush
  include mongodb
  include java
  include solr
  include stagingsync
  include wget
  include postfix
  include imagemagick
  include heroku

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  exec { "brew tap homebrew/php":
    before => Package['drush'],
    creates => "${boxen::config::home}/homebrew/Library/Taps/homebrew/homebrew-php",
  }

  file { "${boxen::config::srcdir}/oddboxen":
    ensure => link,
    target => $boxen::config::repodir
  }

  git::config::global{ 'core.filemode':
    value => false
  }
  git::config::global{ 'mergetool.keepBackup':
    value => false
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
