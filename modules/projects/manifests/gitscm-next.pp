class projects::gitscm-next {

  # Where do we live?

  $dir = "${boxen::config::srcdir}/gitscm-next"

  # Clone all the codes!

  repository { $dir:
    source => 'github/gitscm-next'
  }

  ruby::local { $dir:
    require => Repository[$dir],
    version => '1.9.2'
  }
}
