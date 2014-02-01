class people::awaxa::puppetlabs {

  include hipchat
  include git

  $src = "${boxen::config::srcdir}"
  $globalruby = $people::awaxa::globalruby
  $email = 'greg.kitson@puppetlabs.com'

  repository { "${src}/puppet":
    source => 'puppetlabs/puppet',
  }
  git::config::local { "${src}/puppet":
    key     => 'user.email',
    value   => "$email",
    require => Repository["${src}/puppet"],
  }

  repository { "${src}/facter":
    source => 'puppetlabs/facter',
  }
  git::config::local { "${src}/facter":
    key     => 'user.email',
    value   => "$email",
    require => Repository["${src}/facter"],
  }

  repository { "${src}/courseware-fundamentals":
    source => 'awaxa/courseware-fundamentals',
  }
  git::config::local { "${src}/courseware-fundamentals":
    key     => 'user.email',
    value   => "$email",
    require => Repository["${src}/courseware-fundamentals"],
  }

  ruby::gem { "showoff for $globalruby":
    gem     => 'showoff',
    ruby    => "$globalruby",
    version => '>= 0.9.7',
  }

  file { '/usr/local/bin/envpuppet':
    ensure  => link,
    target  => "$src/puppet/ext/envpuppet",
    require => [ Repository["$src/puppet"], File['/usr/local/bin'] ],
  }

  repository { "${src}/seteam-vagrant-stack":
    source => 'puppetlabs/seteam-vagrant-stack',
  }
  git::config::local { "${src}/seteam-vagrant-stack":
    key     => 'user.email',
    value   => "$email",
    require => Repository["${src}/seteam-vagrant-stack"],
  }

}
