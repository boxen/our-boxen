class people::ccelebi {
  notify {'Setting up Chris Celebi's Profile':}
  include cylent::dev_environment
  include python::virtualenvwrapper
  include cylent::apps::ansible

  include projects::endpoint
  include projects::portal
  include spectacle
  include dropbox
  include googledrive
  include sourcetree
  include docker
  include virtualbox
  include caffeine
  include flux
  include spf13vim3
  include usbethdriver

  include brewcask
  homebrew::tap { 'homebrew/dupes': }

  package {
            [
              '1password',
              'alfred',
              'cakebrew',
              'nmap'
              'flash',
              'gpgtools',
              'android-file-transfer',
              'menumeters',
              'sequel-pro',
              'slack',
              'spotify',
              'torbrowser',
              'vlc',
              'psequel'
            ]: provider => 'brewcask'
  }

  #Needed for ansible
  $crypto_keys = "${home}/keys"

  file {$crypto_keys:
    ensure => directory
  }

  notify {'awscli':}

  ###### Environment Settings ##########
  include osx::dock::dim_hidden_apps
  include osx::finder::show_all_on_desktop
  include osx::finder::empty_trash_securely
  include osx::finder::show_hidden_files

  class { 'osx::global::natural_mouse_scrolling':
    enabled => true
  }

  class { 'osx::dock::hot_corners':
    top_right => 'Application Windows',
    top_left  => 'Desktop'
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
