class projects::training {
  require ruby::1-9-3
  require github::services::mongodb
  require nginx::config

  $dir = "${boxen::config::srcdir}/training"

  file { "${nginx::config::sitesdir}/training.conf":
    content => template('github/projects/training/nginx.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['com.github.nginx']
  }

  repository { $dir:
    source => 'github/training'
  }

  ruby::local { $dir:
    require => Repository[$dir],
    version => '1.9.3-p194'
  }
}
