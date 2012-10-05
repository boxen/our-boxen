class projects::boxen {
  $dir = "${boxen::config::srcdir}/boxen"

  repository { $dir:
    source => 'boxen/boxen'
  }

  ruby::local { $dir:
    version => 'system',
    require => Repository[$dir]
  }
}
