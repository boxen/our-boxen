class people::ejoubaud {
  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  repository { $dotfiles:
    source  => 'ejoubaud/dotfiles',
  }

  include brewcask

  $caskpackages = [
    'alfred',
    'bettertouchtool',
    'firefox',
    'filezilla',
    'google-chrome',
    'github',
    'gitx',
    'karabiner',
    'licecap',
    'mplayerx',
    'private-internet-access',
    'seil',
    'selfcontrol',
    'skype',
    'sequel-pro',
    'vagrant',
    'vlc',
    'virtualbox',
  ]

  package { $caskpackages:
    provider => 'brewcask',
  }

  include iterm2::stable
  include sublime_text

  sublime_text::package {
    'SideBarEnhancements':        source => 'titoBouzout/SideBarEnhancements';
    'GitHubinator':               source => 'ehamiter/ST2-GitHubinator';
    'Shell-Turtlestein':          source => 'misfo/Shell-Turtlestein';
    'ExpandSelectionByParagraph': source => 'natew/ExpandSelectionByParagraph';
    'stringutilities':            source => 'akalongman/sublimetext-stringutilities';
    'ChangeQuotes':               source => 'colinta/SublimeChangeQuotes';
    'Puppet':                     source => 'russCloak/SublimePuppet';
    'Stylus':                     source => 'billymoon/Stylus';
    'Sass':                       source => 'nathos/sass-textmate-bundle';
    'Jade':                       source => 'davidrios/jade-tmbundle';
    'HAML':                       source => 'phuibonhoa/handcrafted-haml-textmate-bundle';
    'Better CoffeeScript':        source => 'aponxi/sublime-better-coffeescript';
    'SSH Config':                 source => 'robballou/sublimetext-sshconfig';
    'Cucumber':                   source => 'ejoubaud/cucumber-sublime-bundle'; # TODO: Revert to original when they merge the st3 branch to master, or when Boxen repository supports branches.
    'cucumber-step-finder':       source => 'danielfrey/sublime-cucumber-step-finder';
  }
}
