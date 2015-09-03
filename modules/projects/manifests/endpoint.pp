class projects::endpoint {

  repository { "${cylent_repo_dir}/kimya":
    source => 'barklyprotects/kimya',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/SecureZone":
    source => 'barklyprotects/securezone',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/trebuchet-x86":
    source => 'barklyprotects/trebuchet-x86',
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

  npm_module {'coffee-script':
    module => 'coffee-script',
    node_version => '0.12',
    version => '~> 1.7.0'
  }

  npm_module {'grunt-cli':
    module => 'grunt-cli',
    node_version => '0.12',
    version => '0.1.13'
  }

}
