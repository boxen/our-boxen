class projects::pages-jekyll {
  require ruby::1-8-7

  $dir = "${boxen::config::srcdir}/pages-jekyll"

  repository { $dir:
    source => 'github/pages-jekyll'
  }

  ruby::local { $dir:
    version => '1.8.7',
    require => Repository[$dir]
  }

  file { "${boxen::config::envdir}/pages-jekyll.sh":
    content => template('github/projects/pages-jekyll/env.sh.erb'),
    require => File[$boxen::config::envdir]
  }
}
