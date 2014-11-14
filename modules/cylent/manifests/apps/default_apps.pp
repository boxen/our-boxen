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

  class {'intellij':
    edition => 'ultimate',
    version => '12.1.6'
  }


  class {'vagrant':}

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
}
