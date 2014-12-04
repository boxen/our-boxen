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

  class {'intellij':
    edition => 'ultimate',
    version => '12.1.6'
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
