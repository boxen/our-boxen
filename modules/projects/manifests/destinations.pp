class projects::destinations {
  require ruby::1-9-3
  require github::services::mongodb
  require nginx::config

  $dir = "${boxen::config::srcdir}/destinations"

  file { "${nginx::config::sitesdir}/destinations.conf":
    content => template('github/projects/destinations/nginx.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['com.github.nginx']
  }

  repository { $dir:
    source => 'github/destinations'
  }

  ruby::local { $dir:
    require => Repository[$dir],
    version => '1.9.3-p194'
  }
}
