class people::awaxa::puppetlabs {

  include hipchat
  include git

  $src = "${boxen::config::srcdir}"
  $globalruby = $people::awaxa::globalruby

  define pl_repository () {
    $src = "${boxen::config::srcdir}"
    $email = 'greg.kitson@puppetlabs.com'
    $remote = split("$title", '/')
    $dirname = $remote[1]
    repository { "${src}/${dirname}":
      source => "$title",
    }
    git::config::local { "${src}/${dirname}":
      key     => 'user.email',
      value   => "$email",
      require => Repository["${src}/${dirname}"],
    }
  }

  pl_repository { 'puppetlabs/puppet': }

  pl_repository { 'puppetlabs/facter': }

  pl_repository { 'awaxa/courseware-fundamentals': }

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

  pl_repository { 'puppetlabs/seteam-vagrant-stack': }

}
