class projects::kod {
  require github::services::redis

  $dir = "${boxen::config::srcdir}/kod"

  repository { $dir:
    source => 'github/kod'
  }

  ruby::local { $dir:
    version => '1.9.3-p125',
    require => Repository[$dir]
  }
}
