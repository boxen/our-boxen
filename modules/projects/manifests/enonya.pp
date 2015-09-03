class projects::enonya {
  include python::virtualenvwrapper

  notify { 'class cylent::apps::enonya declared': }

  repository { "${cylent_repo_dir}/enonya":
    source => 'barklyprotects/enonya',
    require => File[$cylent_repo_dir]
  }

  python::mkvirtualenv {'enonya':
    ensure => present,
    systempkgs => true,
  }
}
