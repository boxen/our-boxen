class projects::gitrpc {
  $dir = "${boxen::config::srcdir}/gitrpc"

  repository { $dir:
    source => 'github/gitrpc'
  }

  ruby::local { $dir:
    version => '1.9.3',
    require => Repository[$dir]
  }
}
