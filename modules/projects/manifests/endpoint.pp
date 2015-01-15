class projects::endpoint {

  repository { "${cylent_repo_dir}/portcullis":
    source => 'cylentsystems/portcullis',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/kimya":
    source => 'cylentsystems/kimya',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/kale":
    source => 'cylentsystems/kale',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/trebuchet-x86":
    source => 'cylentsystems/trebuchet-x86',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/endpoint-distribution":
    source => 'cylentsystems/endpoint-distribution',
    require => File[$cylent_repo_dir]
  }
}
