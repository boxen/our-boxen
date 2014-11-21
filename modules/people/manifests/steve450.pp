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

  # OSX Defaults
  include osx::global::enable_keyboard_control_access
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::dock::autohide
  include osx::finder::empty_trash_securely
  include osx::finder::show_hidden_files
  include osx::finder::show_all_filename_extensions
  include osx::safari::enable_developer_mode

  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

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
