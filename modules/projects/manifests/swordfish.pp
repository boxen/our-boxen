class projects::swordfish {
  require boxen::config
  require github::services::mongodb
  require phantomjs

  $dir = "${boxen::config::srcdir}/swordfish"

  repository { $dir:
    source => 'github/swordfish'
  }

  ruby::local { $dir:
    version => '1.9.3',
    require => Repository[$dir]
  }
}
