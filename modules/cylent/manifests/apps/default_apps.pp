class cylent::apps::default_apps {
  notify { 'class cylent::apps::default_apps declared': }

  include chrome
  include wget
  include xquartz
  include atom
  include macvim
  include vmware_fusion
  include cmake
  include iterm2::dev
  include tunnelblick
  include googledrive
  include virtualbox
  include screenhero



  class { 'firefox':
     version => '36.0'
  }

  file {'node.zsh':
    path => "${cylent_env}/zsh/node.zsh",
    ensure => file,
    require => [Repository[$cylent_dotfiles],File[$cylent_env]],
    content => template("cylent/node_env.erb")
  }

  class {'intellij':
    edition => 'ultimate',
    version => '14.1.4'
  }


  class {'vagrant':
    version => '1.7.2'
  }

  class {'docker':
    version => '1.8.0'
  }


  # Homebrew Packages

  package { 'github-desktop':
    provider => 'brewcask'
  }
  class java {
    homebrew::tap { 'homebrew/versions': }
    package { 'java':
      provider => 'brewcask'
    }
    package { 'java6':
      provider => 'brewcask'
    }
  }

  package {
    [
      'maven',
      'findutils',
      'gnu-tar',
      'ack',
      'tree',
      'watch',
      'git-crypt',
      'go',
    ]:
  }
  ->
  file {'/bin/git-crypt':
    ensure => link,
    target => "/opt/boxen/homebrew/bin/git-crypt"
  }
}
