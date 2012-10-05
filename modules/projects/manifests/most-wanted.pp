class projects::most-wanted {
  require ruby::1-9-3

  $dir = "${boxen::config::srcdir}/most-wanted"

  repository { $dir:
    source => 'github/most-wanted'
  }

  ruby::local { $dir:
    require => Repository[$dir],
    version => '1.9.3'
  }
}

