class people::camilleldn {

  /**************************************
    3D design and printing
  ***************************************/
    # 123D Design
    # Art of Illusion
    # AutoCAD
    # Blender
    # Cura

  /**************************************
    Browsers
  ***************************************/
    include chrome
    include chrome::canary
    include firefox
    include opera

  /**************************************
    Communication
  ***************************************/
    # Airmail 2
    include colloquy
    # Slack
    include skype
    # TweetDeck

  /**************************************
    Cooking
  ***************************************/
    # Paprika Recipe Manager

  /**************************************
    Document management
  ***************************************/
    include dropbox
    # Google Drive
    include libreoffice
    # Spideroak

  /**************************************
    Entertainment
  ***************************************/
    include sonos
    include spotify
    include steam
    include vlc

  /**************************************
    Graphics editor
  ***************************************/
    # GIFBrewery
    # Pixelmator
    # Photoshop suite

  /**************************************
    Photography
  ***************************************/
    # Aperture
    # gps4cam

  /**************************************
    Presentations
  ***************************************/
    # Deckset
    # Keynote

  /**************************************
    Quantified self
  ***************************************/
    include fitbit

  /**************************************
    Reading
  ***************************************/
  # Kindle
    # Pocket

  /**************************************
    Software development
  ***************************************/
    # Code editors
    include atom
    include macvim
    include rubymine
    include sublime_text::v2
    sublime_text::v2::package { 'Emmet':
      source => 'sergeche/emmet-sublime'
    }

    # Documentation
    include dash

    # Languages (not in brew, osx or main manifest)
    include clojure
    package { 'go':
      ensure          => present,
      install_options => '--cross-compile-common',
    }
    include java
    include php
    package {
      [
        'virtualenv',
        'virtualenvwrapper'
      ]:
      ensure => present,
      provider => pip,
    }

    # Licencing
    package { 'lice':
      ensure   => present,
  provider => 'pip',
    }

    # Pairing
    include screenhero

    # Source control
    include sourcetree

    # Teaching
    # Scratch
    # Sonic Pi

    # Virtual machines
    include docker
    include vagrant
    include virtualbox

  /**************************************
    Task management
  ***************************************/
    # Things

  /**************************************
    Utilities
  ***************************************/
    # Desktop/Bar/Window management
    include alfred
    include bartender
    # Caffeine
    include flux
    # Satellite Eyes
    include sizeup
    # SlimBatteryMonitor
    # SwitchResX

    # Password management
    # LastPass

    # Memory/performance/disk management
    include appcleaner
    # CleanMyMac 2
    # XBench

    # Screen capture
    # Licecap
    # Paparazzi
    # Reflector
    # Screenflow

    # Security
    include gpgtools

    # VPN
    # PureVPN

  /**************************************
    Writing
  ***************************************/
    # Day One
    include evernote
    include mou
    include mou::themes

  # Homebrew packages
  package {
    [
      'autojump',
      'bash',
      'bash-completion',
      'bfg',
      'binutils',
      'cifer',
      'colordiff',
      'ctags',
      'dex2jar',
      'dns2tcp',
      'dtrx',
      'elasticsearch',
      'fcrackzip',
      'fig',
      'foremost',
      'fping',
      'gpg-agent',
      'gnupg',
      'hashpump',
      'heroku-toolbelt',
      'htop-osx',
      'hydra',
      'imagemagick',
      'john',
      'knock',
      'mongodb',
      'moreutils',
      'mysql',
      'narwhal',
      'nmap',
      'phantomjs',
      'pngcheck',
      'postgres',
      'python',
      'rbenv-bundler',
      'redis',
      'ringojs',
      's3cmd',
      'ssh-copy-id',
      'sslscan',
      'socat',
      'solr',
      'sqlmap',
      'tcpflow',
      'tcpreplay',
      'tcptrace',
      'tmux',
      'unrar',
      'ucspi-tcp',
      'xz',
      'zsh-completions',
    ]:
    ensure => present,
  }

  #Setup directories and dotfiles
    
/***********************************
  Chrome extensions
************************************/
  # AdBlock
  # Boomerang for Gmail
  # Ghostery
  # Google Docs
  # Hangouts
  # Json Formatter
  # Postman - REST Client
  # Save to Pocket
  # Talky Screensharing
  # XV - XML Viewer
}
