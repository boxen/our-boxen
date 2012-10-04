require boxen::environment
require homebrew::repo

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $luser,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ]
}

File {
  group => 'staff',
  owner => $luser
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => Class['git']
}

Service {
  provider => ghlaunchd
}

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx
  include nvm
  include rbenv

  # fail if FDE is not enabled
  if $::root_encrypted == false {
    fail('Please enable full disk encryption and try again')
  }

  repository { "${boxen::home}/repo":
    ensure => present,
    source => 'boxen/our-boxen'
  }

  # node versions
  include nodejs::0-4
  include nodejs::0-6
  include nodejs::0-8

  # default ruby versions
  include ruby::1-8-7
  include ruby::1-9-2
  include ruby::1-9-3

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }
}
