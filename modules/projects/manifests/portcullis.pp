class projects::portcullis {

  repository { "${cylent_repo_dir}/CylentLogMonitor":
    source => 'barklyprotects/CylentLogMonitor',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/portcullis":
    source => 'barklyprotects/portcullis',
    require => File[$cylent_repo_dir]
  }

}
