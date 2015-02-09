class projects::endpoint {

  repository { "${cylent_repo_dir}/kimya":
    source => 'cylentsystems/kimya',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/trebuchet-x86":
    source => 'cylentsystems/trebuchet-x86',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/bandit":
    source => 'cylentsystems/bandit',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/easyloggingpp":
    source => 'cylentsystems/easyloggingpp',
    require => File[$cylent_repo_dir]
  }

  nodejs::module {'coffee-script':
    node_version => 'v0.10.31'
  }

  nodejs::module {'grunt-cli':
    node_version => 'v0.10.31'
  }

}
