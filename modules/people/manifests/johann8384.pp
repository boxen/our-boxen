class people::johann8384 {
  include docker
  include virtualbox
  include chrome
  include iterm2::colors::solarized_dark
  include iterm2::stable
  include java
  include wget
  include screen
  include slack
  include steam
  include hub
  include bash
  include bash::completion
  include vagrant
  vagrant::plugin { 'vagrant-dns': }
  vagrant::plugin { 'vagrant-vbguest': }
  package { 'qt': }

  $home  = "/Users/${::boxen_user}"
  $code  = "${home}/code"

  file { $code:
    ensure  => directory
  }

  # Git
  git::config::global { 'alias.master': value => '!git checkout master && git pull origin master' }
  git::config::global { 'color.ui': value => 'true' }
  git::config::global { 'user.name': value => 'Jonathan Creasy' }
  git::config::global { 'user.email': value => 'jonathan.creasy@gmail.com' }
  git::config::global { 'rebase.autosquash': value => 'true' }
  git::config::global { 'core.editor': value => 'nano' }

  #git::config::local { 'repo_specific_email':
  #  ensure => present,
  #  repo   => '/path/to/my/repo',
  #  key    => 'user.email',
  #  value  => 'turnt@example.com'
  #}

  #repository { 'opentsdb-opentsdb':
  #  source => 'git@github.com:previousnext/private-project',
  #  path => "${code}/private-project",
  #}

  repository { 'opentsdb-opentsdb':
    source => 'opentsdb/opentsdb',
    path => "${code}/opentsdb",
  }

  repository { 'scopatz-nanorc':
    source => 'scopatz/nanorc',
    path => "${home}/.nano",
  }

#  class { 'nodejs::global': version => '0.12.7' }

#  class { 'intellij':
#    edition => 'ultimate',
#  }

  # .bash_profile
  file { "${home}/.bash_profile":
    source => 'puppet:///modules/people/johann8384/bash_profile',
  }

  # .nanorc
  file { "${home}/.nanorc":
    source => 'puppet:///modules/people/johann8384/nanorc',
  }

  # .nanorc
  file { "${home}/.inputrc":
    source => 'puppet:///modules/people/johann8384/inputrc',
  }

  file { "${home}/.gitexcludes":
    source => 'puppet:///modules/people/johann8384/gitexcludes',
  }


  sudoers { 'johann8384_sudo':
    users    => $::boxen_user,
    type     => 'user_spec',
    commands => '(ALL) NOPASSWD: ALL',
    hosts    => 'ALL',
    comment  => 'Stop asking me to sudo',
  }

  homebrew::tap { 'homebrew/dupes': }

  package { ['nano', 'awscli', 'gradle', 'maven']:
    ensure => latest,
  }

  package {
    [
      'ansible',
      'go',
      'gpg-agent',
      'git',
      'bash-git-prompt',
      'gpg',
      'tmux',
      'tree',
      'zookeeper',
      'influxdb',
      'elasticsearch',
      'rabbitmq',
    ]:
    ensure => present,
  }

  package { 'python':
    ensure => present,
  } ->
  package {
    ['virtualenv', 'virtualenvwrapper']:
    ensure   => present,
    provider => pip,
  }

  class { 'ssh_config': }
  ssh_config::fragment{ 'user':
    content => template('people/johann8384/ssh_config.erb'),
  }

  include osx::no_network_dsstores
  include osx::dock::autohide
  include osx::disable_app_quarantine
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  #include osx::keyboard::capslock_to_control

  #class { 'osx::global::natural_mouse_scrolling':
  #  enabled => false
  #}
  boxen::osx_defaults { 'enable trackpad three-finger drag':
    ensure => present,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'TrackpadThreeFingerDrag',
    value  => '1',
    user   => $::boxen_user,
  }
  boxen::osx_defaults { 'show battery percentage remaining':
    ensure => present,
    domain => 'com.apple.menuextra.battery',
    key    => 'ShowPercent',
    type   => 'string',
    value  => 'YES',
    user   => $::boxen_user,
  }

}
