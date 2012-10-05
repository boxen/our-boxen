class projects::gist {
  require github::packages::qt

  require projects::github::dbs
  mysql::db { 'gist_test': }

  $dir = "${boxen::config::srcdir}/gist"

  require nginx::config

  file { "${nginx::config::sitesdir}/gist.conf":
    content => template('github/projects/gist/nginx.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['com.github.nginx']
  }

  repository { $dir:
    source => 'github/gist'
  }

  ruby::local { $dir:
    version => '1.9.3-p194',
    require => Repository[$dir]
  }
}
