class projects::jobs {
  require nginx

  $dir = "${boxen::config::srcdir}/jobs"

  repository { $dir:
    source => 'github/jobs'
  }

  ruby::local { $dir:
    version => '1.9.3',
    require => Repository[$dir]
  }

  postgresql::db { 'jobs_test': }
  postgresql::db { 'jobs_development': }
}
