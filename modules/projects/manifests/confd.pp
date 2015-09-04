class projects::confd {
  include homebrew::config
  exec{'retrieve confd':
    command => "${homebrew::config::installdir}/bin/wget -q https://github.com/kelseyhightower/confd/releases/download/v0.10.0/confd-0.10.0-darwin-amd64 -O ${homebrew::config::installdir}/bin/confd",
    creates => "${homebrew::config::installdir}/bin/confd",
    require => Class['wget']
  }
  ->
  file{"${homebrew::config::installdir}/bin/confd":
    mode => 'a+x',
  }
  ->
  file{'/etc/confd':
    ensure => directory
  }
  ->
  file{'/etc/confd/conf.d':
    ensure => directory
  }
  ->
  file{'/etc/confd/templates':
    ensure => directory
  }
}
