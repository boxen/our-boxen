class projects::amen {
  $dir = "${boxen::config::srcdir}/amen"

  repository { $dir:
    source => 'github/amen'
  }

  nodejs::local { $dir:
    version => '0.4',
    require => Repository[$dir]
  }
}
