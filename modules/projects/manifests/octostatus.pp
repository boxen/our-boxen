class projects::octostatus {
  require wget

  mysql::db { [
    'octostatus_development',
    'octostatus_test'
  ] : }

  $dir = "${boxen::config::srcdir}/octostatus"

  repository { $dir:
    source => 'github/octostatus'
  }

  ruby::local { $dir:
    version => '1.9.3-p194',
    require => Repository[$dir]
  }
}
