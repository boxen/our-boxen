class projects::ci {
  $dir = "${boxen::config::srcdir}/ci"

  repository { $dir:
    source => 'github/ci'
  }

  ruby::local { $dir:
    version => '1.9.3',
    require => Repository[$dir]
  }
}
