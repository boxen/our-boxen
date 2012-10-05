class projects::speakeasy {
  mysql::db { [
    'speakeasy_development',
    'speakeasy_test'
  ] : }

  $dir = "${boxen::config::srcdir}/speakeasy"

  repository { $dir:
    source => 'github/speakeasy'
  }

  ruby::local { $dir:
    version => '1.9.3-p125',
    require => Repository[$dir]
  }
}
