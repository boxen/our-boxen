class people::steve450 {
  include cylent::dev_environment
  include python::virtualenvwrapper
  include projects::portcullis
  include projects::bamboo_slack_plugin
  include cylent::apps::ansible

  #Needed for ansible
  notify {'awscli':}

  $crypto_keys = "${home}/keys"

  file {$crypto_keys:
    ensure => directory
  }

  include docker
  include virtualbox

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

  # OSX Defaults
  include osx::global::enable_keyboard_control_access
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::finder::empty_trash_securely
  include osx::finder::show_hidden_files
  include osx::finder::show_all_filename_extensions
  include osx::safari::enable_developer_mode

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  class { 'cylent::osx::dock::autohide':
    enabled => false
  }

  include cylent::osx::dock::minimize_to_application

  include osx::dock::icon_size

  class { 'osx::dock::hot_corners':
    top_left => "Launchpad",
    bottom_left => "Mission Control",
    top_right => "Start Screen Saver",
    bottom_right => "Application Windows"
  }

  # End OSX Defaults

  package {
    [
      'zmq',
      'zeromq',
    ]:
  }
}
