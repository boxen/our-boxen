class people::bigfleet {

  include textmate::textmate2::beta
  include sizeup
  include zsh
  include postgresql
  include alfred
  include dropbox
  include handbrake
  include heroku
  include chrome
  include crashplan
  include rdio
  include googledrive
  include iterm2::dev
  include airfoil
  include github_for_mac
  include skype
  include skitch
  include virtualbox
  include redis

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  class { 'nodejs::global': version => 'v0.10.5' }

  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'bigfleet/dot-files',
    require => File[$my]
  }

  include projects::all
}
