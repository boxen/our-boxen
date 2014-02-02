class people::awaxa::applications {

  $globalruby = $people::awaxa::globalruby

  include caffeine
  include chrome
  include dropbox
  #include gpgtools
  include iterm2::dev
  include onepassword
  include java
  include python
  include rdio
  include sizeup
  include skype
  include tunnelblick::beta
  include people::awaxa::vagrant
  include vim
  include virtualbox
  include vlc
  include vmware_fusion

  package { [
    'htop-osx',
    'watch',
    'wget',
    'tree',
    'pstree',
    'apg',
    'tmux',
    ]:
      ensure => latest,
  }

  ruby::gem { "gist for $globalruby":
    gem     => 'gist',
    ruby    => "$globalruby",
  }

  python::pip { 'awscli':
    virtualenv => $python::config::global_venv,
  }

  package {
    'GoogleVoiceAndVideoSetup':
      source => 'http://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg',
      provider => pkgdmg,
  }
}
