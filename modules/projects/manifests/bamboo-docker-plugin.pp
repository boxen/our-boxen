class projects::bamboo-docker-plugin {

  repository { "${cylent_repo_dir}/bamboo-docker-plugin":
    source => 'cylentsystems/bamboo-docker-plugin',
    require => File[$cylent_repo_dir]
  }
}
