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
  # Chrome
  # Chrome Canary
  # Firefox
  # Opera

/**************************************
  Communication
***************************************/
  # Airmail 2
  # Colloquy
  # Slack
  # Skype
  # TweetDeck
  
/**************************************
  Cooking
***************************************/
  # Paprika Recipe Manager
 
/**************************************
  Document management
***************************************/
  # Dropbox
  # Google Drive
  # Libre Office
  # Spideroak

/**************************************
  Entertainment
***************************************/
  # Sonos
  # Spotify
  # Steam
  # VLC

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
  # Fitbit

/**************************************
  Reading
***************************************/
  # Kindle
  # Pocket

/**************************************
  Software development
***************************************/
  # Code editors
  # Atom
  # Macvim
  # Rubymine
  # Sublime Text

  # Documentation
  # Dash
  
  # Languages (not in brew, osx or main manifest)
  # Clojure
  # Go
  # Java
  # PHP
  # Python (+ pip, virtualenv)
  
  # Licencing
  # Lice

  # Pairing
  # Screenhero

  # Source control
  # Sourcetree

  # Teaching
  # Scratch
  # Sonic Pi

  # Virtual machines
  # Docker
  # Vagrant
  # Virtualbox

/**************************************
  Task management
***************************************/
  # Things

/**************************************
  Utilities
***************************************/
  # Desktop/Bar/Window management
  # Alfred
  # Bartender
  # Caffeine
  # Flux
  # Satellite Eyes
  # SizeUp
  # SlimBatteryMonitor
  # SwitchResX
  
  # Password management
  # LastPass
  
  # Memory/performance/disk management
  # AppCleaner
  # CleanMyMac 2
  # XBench

  # Screen capture
  # Licecap
  # Paparazzi
  # Reflector
  # Screenflow
  
  # Security
  # GPG tools
 
  # VPN
  # PureVPN

/**************************************
  Writing
***************************************/
  # Day One
  # Evernote
  # Mou

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
