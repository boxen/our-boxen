class projects::portal {
  include redis
  include stdlib
  include sysctl
  include postgresql
  include projects::etcd
  include projects::confd

  repository { "${cylent_repo_dir}/angalia-web":
    source => 'cylentsystems/angalia-web',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/angalia-api":
    source => 'cylentsystems/angalia-api',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/dropwizard-sisu":
    source => 'cylentsystems/dropwizard-sisu',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/angalia-docker":
    source => 'cylentsystems/angalia-docker',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/angalia-test":
    source => 'cylentsystems/angalia-test',
    require => File[$cylent_repo_dir]
  }
  
}
