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
  include git
  include hub
  include rbenv
  include nvm

  # node versions
  include nodejs::0-6
  include nodejs::0-8

  # default ruby versions
  include ruby::1-9-3-p194
}
