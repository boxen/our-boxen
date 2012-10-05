class projects::hq-puppet {
  require github::packages::augeas
  require ruby::1-8-7

  $dir = "${boxen::config::srcdir}/hq-puppet"

  repository { $dir:
    source => 'github/hq-puppet',
  }

  ruby::local { $dir:
    version => '1.8.7-p358',
    require => Repository[$dir]
  }

}
