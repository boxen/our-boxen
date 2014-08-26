if $::osfamily == 'Debian'
{
  stage { 'pre':
    before => Stage["main"],
  }
  class{'boxen::debian_dependencies': 
    stage => 'pre',
  }
}
require boxen::environment
require homebrew
if $::osfamily == 'Darwin' 
{ 
  require gcc
}

Exec {
  logoutput   => on_failure,
  user        => $::boxen_user,
  group       => $::boxen_group,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
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
  group => $::boxen_group,
  owner => $::boxen_user
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

if $::osfamily == 'Darwin' {
	Service {
	  provider => ghlaunchd
	}
}

Homebrew::Formula <| |> -> Package <| provider != apt |>

# if a homebrew package build fails with a message like "Illegal instruction: 4" on a vbox VM, add the package title to $bottle_broken_packages
if ($::virtual == 'virtualbox' and $::osfamily == 'Darwin')
{
  $bottle_broken_packages = [ 'boxen/brews/gcc48' ]
  class {'boxen::bottle_fixes':
    formula_titles => $bottle_broken_packages,
  }
}

node default {
  # core modules, needed for most things
  include dnsmasq
  include git
  include hub
  include nginx
  if $::kernel == 'Linux' 
	{ 
	  include pkgconfig
	}

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  # node versions
  include nodejs::v0_6
  include nodejs::v0_8
  include nodejs::v0_10

  # default ruby versions
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }
  ruby::version { '2.1.1': }
  ruby::version { '2.1.2': }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
