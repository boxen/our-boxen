class cylent::apps::default_apps {
  notify { 'class cylent::apps::default_apps declared': }

  include chrome
  include firefox
  include wget
  include xquartz
  include atom
  include hipchat
  include macvim
  include vmware_fusion
  include cmake
  include iterm2::dev
  include tunnelblick
  include github_for_mac
  include java6 #needed for intellij
  include java
  include maven
  include googledrive

  file {'node.zsh':
    path => "${cylent_env}/node.zsh",
    ensure => file,
    require => [Repository[$cylent_dotfiles],File[$cylent_env]],
    content => template("cylent/node_env.erb")
  }

  class {'intellij':
    edition => 'ultimate',
    version => '14.0.2'
  }


  class {'vagrant':
    version => '1.6.5'
  }

  # Homebrew Packages
  package {
    [
      'findutils',
      'gnu-tar',
      'ack',
      'tree',
      'watch',
      'git-crypt',
    ]:
  }
  ->
  file {'/bin/git-crypt':
    ensure => link,
    target => "/opt/boxen/homebrew/bin/git-crypt"
  }
}
