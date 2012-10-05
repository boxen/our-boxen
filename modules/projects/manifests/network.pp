class projects::network {
  $dir = "${boxen::config::srcdir}/network"

  repository { $dir:
    source => 'github/network',
  }

}
