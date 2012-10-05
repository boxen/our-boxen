class projects::atom {
  require nodejs::0-8

  $dir = "${boxen::config::srcdir}/atom"

  repository { $dir:
    source => 'github/atom'
  }

  nodejs::local { $dir:
    version => '0.8',
    require => Repository[$dir]
  }
}
