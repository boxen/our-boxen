class projects::graphme {
  $dir = "${boxen::config::srcdir}/graphme"

  repository { $dir:
    source => 'github/graphme'
  }

  nodejs::local { $dir:
    version => '0.4',
    require => Repository[$dir]
  }
}
