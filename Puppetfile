# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Core modules for a basic development environment. You can replace
# some/most of those if you want, but it's not recommended.

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "0.2.3"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",  "0.2.1"
github "gcc",      "0.0.2"
github "git",      "0.1.0"
github "homebrew", "0.3.2"
github "hub",      "0.0.1"
github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
github "nginx",    "0.2.1"
github "nodejs",   "0.0.2"
github "nvm",      "0.0.5"
github "ruby",     "0.4.2"
github "stdlib",   "3.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",     "0.0.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
