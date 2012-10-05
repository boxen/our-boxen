class projects::setup-web {
  require nginx::config
  require github::services::redis

  file { "${nginx::config::sitesdir}/setup-web.conf":
    content => template('github/projects/setup-web/nginx.conf.erb'),
    notify  => Service['com.github.nginx']
  }

  $dir = "${boxen::config::srcdir}/setup-web"

  repository { $dir:
    source => 'github/setup-web'
  }

  file { "${dir}/.env":
    replace => false,
    require => Repository[$dir],
    source  => 'puppet:///modules/github/projects/setup-web/dotenv'
  }

  postgresql::db { [
    'setup_development',
    'setup_test'
  ] : }

  ruby::local { $dir:
    version => '1.9.3-p194',
    require => Repository[$dir]
  }
}
