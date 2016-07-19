class people::farfromguam {
  include ::people::farfromguam::env_settings

  $_apps = hiera('apps', undef)
  $_homebrew_packages = hiera('homebrew::packages', undef)
  $_homebrew_casks = hiera('homebrew::casks', undef)
  $_homebrew_taps = hiera('homebrew::taps', undef)
  $_homebrew_urls = hiera('homebrew::urls', undef)
  $_appstore_apps = hiera('appstore::apps', undef)
  $_python_pips   = hiera('python::pips', undef)
  $_homedir = "/Users/${::luser}"

  if $_python_pips {
a   validate_array($_python_pips)
  }

  if $_apps {
    validate_array($_apps)
    include $_apps
  }

  if $_appstore_apps {
    validate_hash($_appstore_apps)
    create_resources('appstore::app', $_appstore_apps)
  }

  if $_homebrew_packages {
    package { $_homebrew_packages:
      ensure   => present,
      provider => 'homebrew',
    }
  }

  if $_homebrew_taps {
    homebrew::tap { $_homebrew_taps: }
    Homebrew::Tap<||> -> Package<| provider == 'homebrew' |>
  }

  if $_homebrew_casks {
    include ::brewcask
    package { $_homebrew_casks:
      ensure   => present,
      provider => 'brewcask',
    }

    sudoers { 'cask-installer':
      users    => $::boxen_user,
      hosts    => 'ALL',
      commands => [
        '(ALL) NOPASSWD:SETENV: /usr/sbin/installer',
      ],
      type     => 'user_spec',
    }
  }

  if $_homebrew_urls {
    ::adapter::homebrew_url { $_homebrew_urls: }
  }
}
