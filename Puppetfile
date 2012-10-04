# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Includes many of our custom types and providers, as well as global
# config. Required.

mod "boxen",    "0.0.3", :github_tarball => "boxen/puppet-boxen"
mod "homebrew", "0.0.3", :github_tarball => "boxen/puppet-homebrew"
mod "nvm",      "0.0.2", :github_tarball => "boxen/puppet-nvm"

# Core modules for a basic development environment.
# You can replace some/most of those if you want, but it's not recommended.
%w(ruby rbenv nodejs git hub inifile sudo).each do |modulename|
  mod modulename, "0.0.1", :github_tarball => "boxen/puppet-#{modulename}"
end

# Add your custom modules here.
# There are tons available at https://github.com/boxen.
