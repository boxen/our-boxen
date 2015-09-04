class people::ombr {
  include macvim

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'ombr/dotfiles',
    require => File[$my]
  }
}
