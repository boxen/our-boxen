class projects::hubot-classic {
  require boxen::config
  require github::services::redis

  $dir = "${boxen::config::srcdir}/hubot-classic"

  repository { $dir:
    source => 'github/hubot-classic'
  }

  nodejs::local { $dir:
    version => '0.8',
    require => Repository[$dir]
  }

  # The hubot-scripts Redis stuff expects either a standard Redis port
  # on localhost or the REDISTOGO_URL environment variable, so let's
  # make it available.

  file { "${boxen::config::envdir}/hubot-classic.sh":
    content => template('github/projects/hubot-classic/env.sh.erb'),
    require => File[$boxen::config::envdir]
  }
}
