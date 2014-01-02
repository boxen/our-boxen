class people::awaxa::applications {
  include caffeine
  include chrome
  #include dropbox
  #include gpgtools
  include onepassword
  include java
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
  
  package { 'GoogleVoiceAndVideoSetup':
    source => 'http://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg',
    provider => pkgdmg,
  }
}
