class cylent::dev_environment {
  notify { 'class cylent::dev_envronment declared': }

  Repository {
    provider => git,
    extra    => [
      '--recurse-submodules'
    ],
    require  => File["${boxen::config::bindir}/boxen-git-credential"],
    config   => {
      'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
    }
  }

  include cylent::apps::default_apps
  include cylent::vagrant::vagrant_vmware

  file { $cylent_repo_dir:
    ensure => directory
  }

  file {$cylent_env:
    ensure => directory
  }

  repository { "${cylent_repo_dir}/vagrantfiles":
    source => 'cylentsystems/vagrantfiles',
    require => File[$cylent_repo_dir]
  }

  repository { "${cylent_repo_dir}/licenses":
    source => 'cylentsystems/licenses',
    require => File[$cylent_repo_dir]
  }

  repository { $cylent_dotfiles:
    source => 'cylentsystems/dotfiles',
    require => File[$cylent_repo_dir]
  }
}
