class cylent::dev_environment {
  notify { 'class cylent::dev_envronment declared': }
  notify { 'Repository Defaults Set': }

  include cylent::apps::default_apps
  include cylent::vagrant::vagrant_vmware


  file { $cylent_repo_dir:
    ensure => directory,
    require  => File["${boxen::config::bindir}/boxen-git-credential"]
  }

  file {$cylent_env:
    ensure => directory
  }

  git::config::global { 'core.autocrlf':
    value => 'input'
  }
  
  git::config::global { 'push.default':
    value => 'simple'
  }

  repository { "${cylent_repo_dir}/vagrantfiles":
    source => 'barklyprotects/vagrantfiles',
    require => File[$cylent_repo_dir]
  }
  ->
  repository { "${cylent_repo_dir}/licenses":
    source => 'barklyprotects/licenses',
    require => File[$cylent_repo_dir]
  }
  ->
  repository { $cylent_dotfiles:
    source => 'barklyprotects/dotfiles',
    require => File[$cylent_repo_dir]
  }

  homebrew::tap { 'atlassian/tap': }

  package { "atlassian/tap/atlassian-plugin-sdk":
    ensure => present,
    require => Homebrew::Tap['atlassian/tap'],
  }
}
