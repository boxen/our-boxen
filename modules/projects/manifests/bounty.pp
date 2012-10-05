class projects::bounty {
  require nginx::config

  file { "${nginx::config::sitesdir}/bounty.conf":
    content => template('github/projects/bounty/nginx.conf.erb'),
    notify  => Service['com.github.nginx']
  }

  postgresql::db { [
    'bounty_development',
    'bounty_test'
  ] : }

  $dir = "${boxen::config::srcdir}/bounty"

  repository { $dir:
    source => 'github/bounty'
  }

  ruby::local { $dir:
    version => '1.9.3',
    require => Repository[$dir]
  }
}
