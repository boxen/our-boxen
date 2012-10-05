class projects::pixelhub {
  require nginx::config
  require imagemagick
  require github::services::redis

  $dir = "${boxen::config::srcdir}/pixelhub"

  # Configure nginx.

  file { "${nginx::config::sitesdir}/pixelhub.conf":
    content => template('github/projects/pixelhub/nginx.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['com.github.nginx']
  }

  # Make sure we have MySQL DBs for dev and testing.

  mysql::db { [
    'pixelhub_development',
    'pixelhub_test'
  ] : }

  # Clone all the codes!

  repository { $dir:
    source => 'github/pixelhub'
  }

  ruby::local { $dir:
    version => '1.9.3',
    require => Repository[$dir]
  }
}
