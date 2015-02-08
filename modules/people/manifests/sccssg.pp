class people::sccssg {
  ##### Custom Apps #####
  include spectacle
  include homebrew
  include quicksilver
  include projects::portal
  include cylent::apps::ansible
  notify {'awscli':}
  include cylent::dev_environment
  include menumeters

  ###### Environment Settings ##########
  include osx::dock::autohide
  include osx::dock::dim_hidden_apps
  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::show_hidden_files

  class { 'osx::global::natural_mouse_scrolling':
    enabled => true
  }

  class { 'osx::dock::hot_corners':
    top_right => "Put Display to Sleep",
    top_left  => "Disable Screen Saver",
    bottom_right => "Put Display to Sleep",
    bottom_left  => "Put Display to Sleep"
  }

  include cylent::osx::dock::minimize_to_application

  ###### Set up oh-my-zsh environment ######
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
