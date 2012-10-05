class projects::monitors {
  require imagemagick

  mysql::db { [
    'monitors_development',
    'monitors_test'
  ] : }

  $dir = "${boxen::config::srcdir}/monitors"

  repository { $dir:
    source => 'github/monitors'
  }

  ruby::local { $dir:
    version => '1.9.3',
    require => Repository[$dir]
  }
}
