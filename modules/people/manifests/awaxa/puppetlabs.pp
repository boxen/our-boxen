class people::awaxa::puppetlabs {

  include hipchat

  $src = "${boxen::config::srcdir}"

  repository {
    "${src}/puppet":
      source => 'puppetlabs/puppet';
    "${src}/facter":
      source => 'puppetlabs/facter';
  }

  file { '/usr/local/bin/envpuppet':
    target  => "$src/puppet/ext/envpuppet",
    require => [ Repository["$src/puppet"], File['/usr/local/bin'] ];
  }
  
}
