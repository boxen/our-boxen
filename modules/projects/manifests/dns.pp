class projects::dns {
  $dir = "${boxen::config::srcdir}/dns"

  repository { $dir:
    source => 'github/dns',
  }
}
