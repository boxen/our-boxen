class cylent::apps::default_apps {
  notify { 'class cylent::apps::default_apps declared': }

  include chrome
  include firefox
  include vim
  include wget
  include xquartz
  include atom
  include hipchat
  include vmware_fusion

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
    ]:
  }
}
