class projects::bamboo_slack_plugin {

  homebrew::tap { 'atlassian/tap': }

  package { "atlassian/tap/atlassian-plugin-sdk":
    ensure => present,
    require => Homebrew::Tap['atlassian/tap'],
  }

  repository { "${cylent_repo_dir}/bamboo-slack-plugin":
    source => 'cylentsystems/bamboo-slack-plugin',
    require => File[$cylent_repo_dir]
  }
}
