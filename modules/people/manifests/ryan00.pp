class people::ryan00 {
  include cylent::dev_environment
  include iterm2::dev
  include dropbox
  include projects::portcullis
  include cylent::apps::ansible
  include projects::endpoint
  include projects::portal
  include projects::bamboo-docker-plugin
  include skype
  include spectacle
  include projects::enonya


  class { 'gpgtools': }

  ###### Environment Settings ##########
  include osx::dock::autohide
  include osx::dock::dim_hidden_apps
  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::show_hidden_files

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  class { 'osx::dock::hot_corners':
    top_right => 'Application Windows',
    top_left  => 'Desktop',
    bottom_right => 'Start Screen Saver',
    bottom_left => 'Dashboard'
  }

  include cylent::osx::dock::minimize_to_application

  ####### personal repositories #######
  $python     = "${cylent_repo_dir}/puppet-python"
  $crypto_keys = "${home}/keys"

  file {$crypto_keys:
    ensure => directory
  }

  notify {'awscli':}
  ->
  class { 'office':}

  package { 'pycharm':
    provider =>  'brewcask'
  }

  repository { $python:
    source => 'barklyprotects/puppet-python',
    require => File[$cylent_repo_dir]
  }

  repository {"${cylent_repo_dir}/oh-my-zsh":
    source => 'robbyrussell/oh-my-zsh',
    require => File[$cylent_repo_dir]
  }

  file {"${home}/.zshrc":
    ensure  => link,
    target => "${cylent_dotfiles}/zshrc",
    require => Repository["${cylent_repo_dir}/oh-my-zsh"]
  }

  file {"${cylent_env}/zsh":
    ensure => link,
    target => "${cylent_dotfiles}/zsh",
    require => [Repository[$cylent_dotfiles],File[$cylent_env]]
  }
  ->
  exec { "chsh -s /opt/boxen/homebrew/bin/zsh":
    user => root,
    path => ["/usr/bin","/bin"],
    onlyif => "bash -c test `dscl . -read /Users/${USER} UserShell | cut -d: -f2 | tr -d ' '` = /opt/boxen/homebrew/bin/zsh"
  }

}
