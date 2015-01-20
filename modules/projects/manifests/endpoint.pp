class projects::endpoint {

  repository { "${cylent_repo_dir}/kimya":
    source => 'cylentsystems/kimya',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/trebuchet-x86":
    source => 'cylentsystems/trebuchet-x86',
    require => File[$cylent_repo_dir]
  }
}
