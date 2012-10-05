class projects::pollex {
  require github::services::redis
  require imagemagick

  $dir = "${boxen::config::srcdir}/pollex"

  repository { $dir:
    source => 'github/pollex'
  }

  ruby::local { $dir:
    version => '1.9.3-p125',
    require => Repository[$dir]
  }
}
