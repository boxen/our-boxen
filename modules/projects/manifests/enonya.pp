class projects::enonya {
  include python::virtualenvwrapper

  notify { 'class cylent::apps::enonya declared': }

  repository { "${cylent_repo_dir}/enonya":
    source => 'barklyprotects/enonya',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/malware-vpc-mgmt":
    source => 'barklyprotects/malware-vpc-mgmt',
    require => FILE[$cylent_repo_dir]
  }

  python::mkvirtualenv {'enonya':
    ensure => present,
    systempkgs => true,
  }
  ->
  python::pip {'enonya-awscli':
    name => 'enonya',
    virtualenv => "${python::config::venv_home}/enonya",
  }
  ->
  exec {'enonya-aws-set-version':
    command => "${python::config::venv_home}/enonya/bin/aws configure set default.s3.signature_version s3v4"
  }
  ->
  file {'enonya.zsh':
    path => "${cylent_env}/enonya.zsh",
    ensure => file,
    content => template("projects/enonya_env.erb")
  }
}
