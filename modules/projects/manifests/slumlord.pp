class projects::slumlord {
  require erlang

  $dir = "${boxen::config::srcdir}/slumlord"

  repository { $dir:
    source => 'github/slumlord'
  }

  ruby::local { $dir:
    version => '1.8.7',
    require => Repository[$dir]
  }
}
