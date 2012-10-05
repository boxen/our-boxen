class projects::haystack {
  require riak
  require nginx::config

  $dir = "${boxen::config::srcdir}/haystack"

  repository { $dir:
    source => 'github/haystack'
  }

  ruby::local { $dir:
    version => '1.9.3',
    require => Repository[$dir]
  }

  file { "${nginx::config::sitesdir}/haystack.conf":
    content => template('github/projects/haystack/nginx.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['com.github.nginx']
  }
}
