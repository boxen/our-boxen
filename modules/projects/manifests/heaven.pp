class projects::heaven {
  $dir = "${boxen::config::srcdir}/heaven"

  repository { $dir:
    source => 'github/heaven'
  }

  ruby::local { $dir:
    version => '1.8.7',
    require => Repository[$dir]
  }
}
