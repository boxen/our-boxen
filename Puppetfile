# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.7.1", :repo => "telamonian/puppet-boxen"

# Support for default hiera data in modules

github "module-data", "0.0.4", :repo => "ripienaar/puppet-module-data"

if RUBY_PLATFORM =~ /linux/
  # If running on linux, include support for doing fancy things with apt
  github 'apt',       "1.5.2", :repo => "puppetlabs/puppetlabs-apt"
elsif RUBY_PLATFORM =~ /darwin/
  # If running on darwin, include support for xquartz
  github "xquartz",     "1.1.1"
end

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",     "1.0.1"
github "foreman",     "1.2.0"
github "gcc",         "2.2.0", :repo => "telamonian/puppet-gcc"
github "git",         "2.7.0", :repo => "telamonian/puppet-git"
github "go",          "1.1.0"
github "homebrew",    "2.0.0", :repo => "telamonian/puppet-homebrew"
github "hub",         "1.4.0", :repo => "telamonian/puppet-hub"
github "inifile",     "1.1.1", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.3"
github "nodejs",      "3.8.1"
github "openssl",     "1.0.0"
github "phantomjs",   "2.3.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "8.2.0", :repo => "telamonian/puppet-ruby"
github "stdlib",      "4.2.1", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
