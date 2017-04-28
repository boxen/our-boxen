require boxen::environment
require homebrew
require gcc

include git
include hub
include adium
include virtualbox
include vagrant
include chrome
include skitch
include iterm2::stable
include iterm2::colors::solarized_dark
include hipchat
include firefox
include ruby

Exec {
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  owner => $boxen_user
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
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

package {
  [
    'ack',
    'findutils',
    'gnu-tar',
    'wget',
    'docker',
    'graphviz',
    'jq',
    'maven',
    'openssl',
    'protobuf241',
    'sqlite',
    'tmux',
    'tree',
    'pdsh',
    'readline'
  ]:
}

package { 'intellij':
  provider => 'brewcask',
  version => '2016.1'
}

package { 'istatmenus':
  provider => 'brewcask'
}
