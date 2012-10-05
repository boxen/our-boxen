class projects::central {
  require github::services::redis

  # Where do we live?

  $dir = "${boxen::config::srcdir}/central"

  # Clone all the codes!

  repository { $dir:
    source => 'github/central'
  }

  ruby::local { $dir:
    version => '1.8.7',
    require => Repository[$dir]
  }
}
