class projects::vpn {
  $dir = "${boxen::config::srcdir}/vpn"

  repository { $dir:
    source => 'github/vpn'
  }
}
