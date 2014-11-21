class projects::portcullis {

  $home       = "/Users/${::boxen_user}"
  $repo_dir   = "${home}/cylent"

  repository { "${repo_dir}/vagrantfiles":
    source => 'cylentsystems/vagrantfiles',
    require => File[$repo_dir]
  }

  repository { "${repo_dir}/CylentLogMonitor":
    source => 'cylentsystems/CylentLogMonitor',
    require => File[$repo_dir]
  }

  repository { "${repo_dir}/portcullis":
    source => 'cylentsystems/portcullis',
    require => File[$repo_dir]
  }
}
