class projects::miramar {
  require nginx::config

  $dir = "${boxen::config::srcdir}/miramar"

  file { "${nginx::config::sitesdir}/miramar.conf":
    content => template('github/projects/miramar/nginx.conf.erb'),
    notify  => Service['com.github.nginx']
  }

  repository { $dir:
    source => 'github/miramar'
  }

  ruby::local { $dir:
    version => '1.9.3',
    require => Repository[$dir]
  }

  postgresql::db { [
    'miramar_development',
    'miramar_test'
  ] : }

}
