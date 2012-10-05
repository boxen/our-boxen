# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Includes many of our custom types and providers, as well as global
# config. Required.

mod "boxen",    "0.0.13",  :github_tarball => "boxen/puppet-boxen"
mod "dnsmasq",  "0.0.1",   :github_tarball => "boxen/puppet-dnsmasq"
mod "git",      "0.0.2.4", :github_tarball => "boxen/puppet-git"
mod "homebrew", "0.0.4",   :github_tarball => "boxen/puppet-homebrew"
mod "nginx",    "0.0.2",   :github_tarball => "boxen/puppet-nginx"
mod "nvm",      "0.0.5",   :github_tarball => "boxen/puppet-nvm"
mod "rbenv",    "0.0.2",   :github_tarball => "boxen/puppet-rbenv"
mod "ruby",     "0.0.8",   :github_tarball => "boxen/puppet-ruby"

# Core modules for a basic development environment.
# You can replace some/most of those if you want, but it's not recommended.
%w(nodejs hub inifile sudo).each do |modulename|
  mod modulename, "0.0.1", :github_tarball => "boxen/puppet-#{modulename}"
end

# Add your custom modules here.
# There are tons available at https://github.com/boxen.
