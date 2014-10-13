class people::ryan00 {
  include cylent::dev_environment

  $home     = "/Users/${::boxen_user}"
  $repo_dir = "${home}/cylent"
  $dotfiles = "${repo_dir}/dotfiles"



  file { $repo_dir:
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
}
