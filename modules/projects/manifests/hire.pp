class projects::hire {
  require nginx::config
  require github::services::mongodb
  require imagemagick
  require elasticsearch

  # Configure nginx.

  file { "${nginx::config::sitesdir}/hire.conf":
    content => template('github/projects/hire/nginx.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['com.github.nginx']
  }

  # Make sure we have MySQL DBs for dev and testing.

  mysql::db { [
    'hire_development',
    'hire_test'
  ] : }

  $dir = "${boxen::config::srcdir}/hire"

  repository { $dir:
    source => 'github/hire'
  }

  ruby::local { $dir:
    version => '1.9.3-p194',
    require => Repository[$dir]
  }
}
