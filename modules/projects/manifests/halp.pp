class projects::halp {
  require ruby::1-9-3
  require github::services::mongodb
  require elasticsearch
  require github::services::redis
  require nginx::config
  require github::packages::qt

  $dir = "${boxen::config::srcdir}/halp"

  file { "${nginx::config::sitesdir}/halp.conf":
    content => template('github/projects/halp/nginx.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['com.github.nginx']
  }

  repository { $dir:
    source => 'github/halp'
  }

  ruby::local { $dir:
    require => Repository[$dir],
    version => '1.9.3-p194'
  }

  package { 'chromedriver': }
}
