class people::steve450 {
  include cylent::dev_environment
  include python::virtualenvwrapper
  include projects::portcullis

  $home       = "/Users/${::boxen_user}"
  $repo_dir   = "${home}/cylent"
  $dotfiles   = "${repo_dir}/dotfiles"
  $env        = "${home}/.env"

  file { $repo_dir:
    ensure => directory
  }

  file {$env:
    ensure => directory
  }

  repository { $dotfiles:
    source => 'cylentsystems/dotfiles',
    require => File[$repo_dir]
  }

  repository {"${repo_dir}/oh-my-zsh":
    source => 'robbyrussell/oh-my-zsh',
    require => File[$repo_dir]
  }

  file {"${home}/.zshrc":
    ensure  => link,
    target => "${dotfiles}/zshrc",
    require => Repository["${repo_dir}/oh-my-zsh"]
  }

  file {"${env}/zsh":
    ensure => link,
    target => "${dotfiles}/zsh",
    require => [Repository[$dotfiles],File[$env]]
  }

  boxen::osx_defaults { 'show all files in Finder':
    ensure => present,
    domain => 'com.apple.Finder',
    key    => 'AppleShowAllFiles',
    value  => 'true',
    type   => 'bool',
    user   => $::boxen_user
  }

  package {
    [
      'zmq',
      'zeromq',
    ]:
  }
}
