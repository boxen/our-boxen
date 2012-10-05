class projects::rails {
  $dir = "${boxen::config::srcdir}/rails"

  repository { $dir:
    source => 'github/rails'
  }
}
