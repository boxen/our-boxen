class projects::shell {
  $dir = "${boxen::config::srcdir}/shell"

  repository { $dir:
    source => 'github/shell'
  }

}
