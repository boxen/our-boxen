class projects::help {
  require elasticsearch
  require github::services::redis

  $dir = "${boxen::config::srcdir}/help"
  repository { $dir:
    source => 'github/help'
  }

  ruby::local { $dir:
    version => '1.9.3-p125',
    require => Repository[$dir]
  }

  mysql::db { 'help_development': }
  mysql::db { 'help_enterprise': }
  mysql::db { 'help_test': }
}
