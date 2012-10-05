class projects::puppet {
  require github::packages::augeas
  require ruby::1-8-7

  $dir = "${boxen::config::srcdir}/puppet"

  repository { $dir:
    source => 'github/puppet'
  }

  ruby::local { $dir:
    version => '1.8.7-p358',
    require => Repository[$dir]
  }

  file { "${dir}/.git/hooks/pre-commit":
    ensure  => present,
    source  => 'puppet:///modules/github/projects/puppet.pre-commit',
    owner   => $::luser,
    group   => 'staff',
    mode    => '0555',
    require => Repository[$dir],
  }
}
