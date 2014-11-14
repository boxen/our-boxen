class people::ryan00 {
  include cylent::dev_environment
  include python::virtualenvwrapper
  include pycharm
  include iterm2::dev

  $home       = "/Users/${::boxen_user}"
  $repo_dir   = "${home}/cylent"
  $dotfiles   = "${repo_dir}/dotfiles"
  $ansible    = "${repo_dir}/ansible"
  $python     = "${repo_dir}/puppet-python"
  $env        = "${home}/.env"

  file { $repo_dir:
    ensure => directory
  }

  file {$env:
    ensure => directory
  }

  ########## ANSIBLE BEGIN ##########

  repository {$ansible:
    source => 'ansible/ansible',
    require => File[$repo_dir]
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

  repository { $python:
    source => 'cylentsystems/puppet-python',
    require => File[$repo_dir]
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
  ->
  exec { "chsh -s /opt/boxen/homebrew/bin/zsh":
    user => root,
    path => ["/usr/bin","/bin"],
    onlyif => "bash -c test `dscl . -read /Users/${USER} UserShell | cut -d: -f2 | tr -d ' '` = /opt/boxen/homebrew/bin/zsh"
  }



  file {'ansible.zsh':
    path => "${env}/ansible.zsh",
    ensure => file,
    require => [Repository[$dotfiles],File[$env]],
    content => template("cylent/ansible_env.erb")
  }
}
