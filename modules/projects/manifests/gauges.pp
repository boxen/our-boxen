class projects::gauges {
  require zeromq
  require memcached
  require github::services::mongodb
  require geoip
  require github::packages::qt
  require icu4c

  $dir = "${boxen::config::srcdir}/gauges"

  repository { $dir:
    source => 'github/gauges'
  }

  ruby::local { $dir:
    version => '1.8.7',
    require => Repository[$dir]
  }
}
