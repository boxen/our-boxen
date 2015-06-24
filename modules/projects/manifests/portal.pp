class projects::portal {
  include redis
  include stdlib
  include sysctl
  include postgresql
  include projects::etcd
  include projects::confd

  repository { "${cylent_repo_dir}/angalia-web":
    source => 'barklyprotects/angalia-web',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/angalia-api":
    source => 'barklyprotects/angalia-api',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/dropwizard-sisu":
    source => 'barklyprotects/dropwizard-sisu',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/angalia-docker":
    source => 'barklyprotects/angalia-docker',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/angalia-test":
    source => 'barklyprotects/angalia-test',
    require => File[$cylent_repo_dir]
  }

}
