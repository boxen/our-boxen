class projects::initrd {
  $dir = "${boxen::config::srcdir}/initrd"

  repository { $dir:
    source => 'github/initrd',
  }
}
