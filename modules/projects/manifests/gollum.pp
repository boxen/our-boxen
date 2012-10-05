class projects::gollum {
  $dir = "${boxen::config::srcdir}/gollum"

  repository { $dir:
    source => 'github/gollum'
  }
}
