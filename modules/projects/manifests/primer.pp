class projects::primer {
  $dir = "${boxen::config::srcdir}/primer"

  repository { $dir:
    source => 'github/primer'
  }
}
