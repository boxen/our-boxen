class projects::portcullis {

  repository { "${cylent_repo_dir}/CylentLogMonitor":
    source => 'cylentsystems/CylentLogMonitor',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/portcullis":
    source => 'cylentsystems/portcullis',
    require => File[$cylent_repo_dir]
  }

}
