class projects::git {
  repository { "${boxen::config::srcdir}/git":
    source => 'github/git'
  }
}
