class projects::portcullis {

  include cylent::vagrant::vagrant_vmware

  repository { "${cylent_repo_dir}/vagrantfiles":
    source => 'cylentsystems/vagrantfiles',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/CylentLogMonitor":
    source => 'cylentsystems/CylentLogMonitor',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/portcullis":
    source => 'cylentsystems/portcullis',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/licenses":
    source => 'cylentsystems/licenses',
    require => File[$cylent_repo_dir]
  }
}
