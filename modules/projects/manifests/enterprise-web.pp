class projects::enterprise-web {
  require ruby::1-9-3

  require github::services::redis
  require gpgme
  require wkhtmltopdf
  require elasticsearch

  postgresql::db { [
    'enterprise_web_development',
    'enterprise_web_test'
  ] : }

  $dir = "${boxen::config::srcdir}/enterprise-web"

  repository { $dir:
    source => 'github/enterprise-web'
  }

  ruby::local { $dir:
    version => '1.9.3-p194',
    require => Repository[$dir]
  }

  nodejs::local { $dir:
    version => '0.8',
    require => Repository[$dir]
  }

  file { "${nginx::config::sitesdir}/enterprise-web.conf":
    content => template('github/projects/enterprise-web/nginx.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['com.github.nginx']
  }
}
