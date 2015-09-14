class projects::bamboo_slack_plugin {

  repository { "${cylent_repo_dir}/bamboo-slack-plugin":
    source => 'barklyprotects/bamboo-slack-plugin',
    require => File[$cylent_repo_dir]
  }
}
