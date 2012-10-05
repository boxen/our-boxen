class projects::bricklayer {
  require virtualbox
  require ruby::1-9-3

  $dir = "${boxen::config::srcdir}/bricklayer"

  repository { $dir:
    source => 'github/bricklayer'
  }

  ruby::local { $dir:
    require => Repository[$dir],
    version => '1.9.3'
  }
}
