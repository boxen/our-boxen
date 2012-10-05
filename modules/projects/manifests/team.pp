class projects::team {
  require github::services::redis
  require elasticsearch
  require github::packages::qt

  postgresql::db { [
    'ghteam_development',
    'ghteam_test'
  ] : }

  $dir = "${boxen::config::srcdir}/team"

  repository { $dir:
    source => 'github/team'
  }

  ruby::local { $dir:
    version => '1.9.3-p125',
    require => Repository[$dir]
  }
}
