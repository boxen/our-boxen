class people::awaxa::puppetlabs {

  include hipchat

  $src = "${boxen::config::srcdir}"
  $globalruby = $people::awaxa::globalruby

  repository { "${src}/puppet":
    source => 'puppetlabs/puppet';
  }
  repository { "${src}/facter":
    source => 'puppetlabs/facter';
  }

  ruby::gem { "showoff for $globalruby":
    gem     => 'showoff',
    ruby    => "$globalruby",
    version => '>= 0.9.7';
  }

  file { '/usr/local/bin/envpuppet':
    target  => "$src/puppet/ext/envpuppet",
    require => [ Repository["$src/puppet"], File['/usr/local/bin'] ];
  }
  
}
