class projects::numbers {
  $dir = "${boxen::config::srcdir}/numbers"

  repository { $dir:
    source => 'github/numbers'
  }

  nodejs::local { $dir:
    version => '0.6',
    require => Repository[$dir]
  }
}
