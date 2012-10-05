class projects::janky {
  require mysql::config

  mysql::db { 'janky_development': }
  mysql::db { 'janky_test': }

  $dir = "${boxen::config::srcdir}/janky"

  repository { $dir:
    source => 'github/janky'
  }

  ruby::local { $dir:
    version => '1.9.3',
    require => Repository[$dir]
  }

  file { "${boxen::config::envdir}/janky.sh":
    content => template('github/projects/janky/env.sh.erb'),
    require => File[$boxen::config::envdir]
  }
}
