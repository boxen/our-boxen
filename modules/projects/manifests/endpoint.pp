class projects::endpoint {

  repository { "${cylent_repo_dir}/kimya":
    source => 'barklyprotects/kimya',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/RapidVisor":
    source => 'barklyprotects/RapidVisor',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/RV-Loaders":
    source => 'barklyprotects/RV-Loaders',
    require => File[$cylent_repo_dir]
  } 

  repository { "${cylent_repo_dir}/RV-Shared":
    source => 'barklyprotects/RV-Shared',
    require => File[$cylent_repo_dir]
  } 

  repository { "${cylent_repo_dir}/RV-Tools":
    source => 'barklyprotects/RV-Tools',
    require => File[$cylent_repo_dir]
  } 

  repository { "${cylent_repo_dir}/bandit":
    source => 'barklyprotects/bandit',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/easyloggingpp":
    source => 'barklyprotects/easyloggingpp',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/OSR_base":
    source => 'barklyprotects/OSR_base',
    require => File[$cylent_repo_dir]
  }

  nodejs::module {'coffee-script':
    node_version => 'v0.10.31'
  }

  nodejs::module {'grunt-cli':
    node_version => 'v0.10.31'
  }

}
