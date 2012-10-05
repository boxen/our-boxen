class projects::community {
  require github::packages::qt

  postgresql::db { [
    'community_development',
    'community_test'
  ] : }

  $dir = "${boxen::config::srcdir}/community"

  repository { $dir:
    source => 'github/community'
  }

  ruby::local { $dir:
    version => '1.9.3-p194',
    require => Repository[$dir]
  }

  file { "${nginx::config::sitesdir}/community.conf":
    content => template('github/projects/community/nginx.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['com.github.nginx']
  }
}
