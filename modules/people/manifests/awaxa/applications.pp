class people::awaxa::applications {
  include caffeine
  include chrome
  #include dropbox
  #include gpgtools
  include onepassword
  include java
  include python
  include rdio
  include tunnelblick::beta
  include vagrant
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
    'tmux'
    ]:
  }
  
  python::pip { 'awscli':
    virtualenv => $python::config::global_venv,
  }

  package {
    'GoogleVoiceAndVideoSetup':
      source => 'http://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg',
      provider => pkgdmg;
  }
}
