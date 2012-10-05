class projects::github {
  require ruby::1-8-7

  require nginx::config

  require elasticsearch
  require icu4c
  require memcached
  require python
  require github::services::redis
  require solr

  require projects::github::dbs
  require projects::pages-jekyll

  package { 'boxen/brews/dpkg':
    ensure  => '1.15.8.12-github1'
  }

  package { 'boxen/brews/md5sha1sum':
    ensure  => '0.9.5-github1'
  }

  # Configure nginx.

  file { "${nginx::config::sitesdir}/github.conf":
    content => template('github/projects/github/nginx.conf.erb'),
    require => File[$nginx::config::sitesdir],
    notify  => Service['com.github.nginx']
  }

  # Where do we live?

  $dir = "${boxen::config::srcdir}/github"

  # Clone all the codes!

  repository { $dir:
    source => 'github/github'
  }

  ruby::local { $dir:
    require => Repository[$dir],
    version => '1.8.7'
  }
}
