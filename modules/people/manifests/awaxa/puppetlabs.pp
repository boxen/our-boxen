class people::awaxa::puppetlabs {

  include hipchat

  repository { "${boxen::config::srcdir}/puppet":
    source => 'puppetlabs/puppet',
  }
  
  repository { "${boxen::config::srcdir}/facter":
    source => 'puppetlabs/facter',
  }
  
}
