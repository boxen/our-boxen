class people::ryan00 {
  include cylent::dev_environment
  include python::virtualenvwrapper
  include pycharm
  include iterm2::dev
  include dropbox
  include projects::portcullis
  include office
  include docker

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
  $ansible    = "${cylent_repo_dir}/ansible"
  $python     = "${cylent_repo_dir}/puppet-python"
  $aws_vpc    = "${cylent_repo_dir}/cylent-ansible"
  $kimya      = "${cylent_repo_dir}/kimya"
  $crypto_keys = "${home}/keys"



  ##This is an encrypted repo talk to ryan@cylentsystems
  ##if you feel you need access
  $aws_mgmt   = "${cylent_repo_dir}/aws-mgmt"



  file {$crypto_keys:
    ensure => directory
  }

  ########## ANSIBLE BEGIN ##########

  repository {$ansible:
    source => 'ansible/ansible',
    require => File[$cylent_repo_dir]
  }

  python::mkvirtualenv {'ansible':
    ensure => present,
    systempkgs => true,
  }
  ->
  python::pip {'pyyaml':
    virtualenv => "${python::config::venv_home}/ansible"
  }
  ->
  python::pip {'jinja2':
    virtualenv => "${python::config::venv_home}/ansible"
  }
  ->
  python::pip {'paramiko':
    virtualenv => "${python::config::venv_home}/ansible"
  }
  ->
  python::pip {'httplib2':
    virtualenv => "${python::config::venv_home}/ansible"
  }
  ->
  python::pip {'boto':
    virtualenv => "${python::config::venv_home}/ansible"}
  ->
  python::pip {'keyring':
    virtualenv => "${python::config::venv_home}/ansible"}
  ->
  python::pip {'awscli':
    virtualenv => "${python::config::venv_home}/ansible"}

  ########## ANSIBLE END ##########

  repository { $aws_mgmt:
    source => 'cylentsystems/aws-mgmt',
    require => File[$cylent_repo_dir]
  }

  repository { $python:
    source => 'cylentsystems/puppet-python',
    require => File[$cylent_repo_dir]
  }

  repository { $aws_vpc:
    source => 'cylentsystems/ansible',
    require => File[$cylent_repo_dir]
  }

  repository { $kimya:
    source => 'cylentsystems/kimya',
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



  file {'ansible.zsh':
    path => "${cylent_env}/ansible.zsh",
    ensure => file,
    require => [Repository[$cylent_dotfiles],File[$cylent_env]],
    content => template("cylent/ansible_env.erb")
  }
}
