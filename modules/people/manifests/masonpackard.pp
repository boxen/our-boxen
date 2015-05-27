class people::masonpackard {

  include textmate::textmate2::beta
  include sizeup
  include zsh
  include postgresql
  include alfred::v1
  include dropbox
  include heroku
  include chrome
  include rdio
  include googledrive
  include iterm2::dev
  include github_for_mac
  include skype
  include skitch
  include virtualbox
  include redis
  include sublime_text
    sublime_text::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

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
