# Manage the setup-puppet project itself. Makes sure that
# /opt/github/setup is actually a git repo, no just a naked snapshot,
# and makes sure it's available through a ~/github/setup-puppet
# symlink.

class projects::setup-puppet {
  require ::git
  require boxen::config

  $dir = "${boxen::config::home}/setup"

  file { "${boxen::config::bindir}/gh-setup":
    mode    => '0755',
    content => template('github/projects/setup-puppet/gh-setup.sh')
  }

  file { "${boxen::config::bindir}/gh-setup-require":
    ensure  => link,
    target  => "${dir}/script/setup-require"
  }

  file { "${boxen::config::bindir}/gh-bootstrap":
    ensure => link,
    target => "${dir}/script/gh-bootstrap"
  }

  file { "${boxen::config::bindir}/gh-my-setup":
    ensure => link,
    target => "${dir}/script/gh-my-setup"
  }

  exec { 'git init':
    cwd     => $dir,
    creates => "${dir}/.git"
  }

  git::config::local { $dir:
    key     => 'credential.helper',
    value   => $::git::credentialhelper,
    require => [
      Package['boxen/brews/git'],
      Exec['git init'],
    ],
  }

  exec { 'git remote add':
    command => 'git remote add origin https://github.com/github/setup-puppet',
    cwd     => $dir,
    require => Exec['git init'],
    unless  => 'git remote -v | grep origin'
  }

  exec { 'git fetch origin && git reset --hard origin/master':
    cwd     => $dir,
    require => Exec['git remote add'],
    timeout => 300,
    unless  => 'git branch -r | grep origin/master'
  }

  exec { 'git branch --set-upstream master origin/master':
    cwd     => $dir,
    require => Exec['git remote add'],
    unless  => 'grep "merge = refs/heads/master" .git/config'
  }

  file { "${boxen::config::srcdir}/setup-puppet":
    ensure => link,
    target => $dir
  }

  file { "${boxen::config::configdir}/setup":
    ensure => directory
  }

  sudoers { 'gh-setup':
    users    => $luser,
    hosts    => 'ALL',
    commands => [
      '(ALL) NOPASSWD : /bin/mkdir -p /tmp/puppet',
      "${dir}/bin/puppet",
      '/bin/rm -f /tmp/github-setup.log'
    ],
    type => 'user_spec',
  }

  sudoers { 'fdesetup':
    users    => $luser,
    hosts    => 'ALL',
    commands => [
      '(ALL) NOPASSWD : /usr/bin/fdesetup status',
      '/usr/bin/fdesetup list',
    ],
    type => 'user_spec',
  }
}
