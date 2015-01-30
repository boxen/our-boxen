class projects::confd {
  exec{'retrieve confd':
    command => "/opt/boxen/homebrew/bin/wget -q https://github.com/kelseyhightower/confd/releases/download/v0.7.1/confd-0.7.1-darwin-amd64 -O /opt/boxen/homebrew/bin/confd",
    creates => "/opt/boxen/homebrew/bin/confd",
    require => Class['wget']
  }
  ->
  file{'/opt/boxen/homebrew/bin/confd':
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
