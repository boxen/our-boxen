class projects::infrastructure_wiki {
  $dir = "${boxen::config::srcdir}/infrastructure.wiki"

  repository { $dir:
    source => 'github/infrastructure.wiki',
  }
}
