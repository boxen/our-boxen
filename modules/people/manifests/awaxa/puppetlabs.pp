class people::awaxa::puppetlabs {

  include hipchat

  $src = "${boxen::config::srcdir}"

  repository {
    "${src}/puppet":
      source => 'puppetlabs/puppet';
    "${src}/facter":
      source => 'puppetlabs/facter';
  }
  
}
