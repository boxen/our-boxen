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
  mod "puppet-#{name}", :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.
github "boxen", "3.11.0"

# Support for default hiera data in modules

github "module_data", "0.0.4", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "brewcask",    "0.0.6"
github "dnsmasq",     "2.0.1"
github "foreman",     "1.2.0"
github "gcc",         "3.0.2"
github "git",         "2.7.92"
github "go",          "2.1.0"
github "homebrew",    "2.0.0"
github "hub",         "1.4.1"
github "inifile",     "1.4.2", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",       "1.4.6"
github "nodejs",      "5.0.2"
github "openssl",     "1.0.0"
github "phantomjs",   "3.0.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.4.1"
github "ruby",        "8.5.2"
github "stdlib",      "4.8.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.2.1"


# Optional/custom modules. There are tons available at
# https://github.com/boxen.
# PLEASE KEEP IN ALPHABETICAL ORDER
github "atom",        "1.3.0"
github "brewcask", "0.0.6"
github "caffeine", "1.0.0"
github "chrome",      "1.2.0"
github "cmake",       "1.0.1"
github "docker",      "0.9.1", :repo => "barklyprotects/puppet-docker-1"
github "dropbox",     "1.4.1"
github "elasticsearch", "2.9.0"
github "evernote", "2.0.7"
github "firefox",     "1.2.3"
github "flux", "1.0.1"
github "gimp", "1.0.1"
github "github_for_mac", "1.0.3"
github "go", "2.1.0"
github "googledrive", "1.0.2"
github "gpgtools", "1.0.4", :repo => "barklyprotects/puppet-gpgtools"
github "heroku", "2.1.1"
github "intellij",    "1.5.1"
github "iterm2",      "1.2.5"
github "java", "1.8.3", :repo => "barklyprotects/puppet-java"
github "java6", "1.0.1", :repo => "barklyprotects/puppet-java6"
github "macvim",      "1.0.0"
github "maven", "1.0.0",  :repo => "barklyprotects/puppet-maven"
github "menumeters", "1.0.1", :repo => "Vodeclic/puppet-menumeters"
github "mysql",         "2.1.2"
github "office","1.0.8", :repo => "barklyprotects/puppet-office"
github "onepassword","1.1.5"
github "osx",         "2.8.0"
github "packer", "0.6.2", :repo => "barklyprotects/puppet-packer"
github "postgresql", "3.0.3clientonly", :repo => "barklyprotects/puppet-postgresql"
github "pycharm",     "1.0.4"
github "python",      "2.0.7", :repo => "barklyprotects/puppet-python"
github "quicksilver", "1.3.0"
github "redis",       "3.2.0"
github "s3bucket", "1.0.8", :repo => "barklyprotects/s3bucket"
github "screenhero", "1.0.1"
github "skype", "1.1.0"
github "sourcetree", "1.0.0"
github "spectacle", "1.0.0"
github "spf13vim3", "1.0.0", :repo => "samjsharpe/puppet-spf13vim3"
github "sysctl", "1.0.1"
github "tmux", "1.0.2"
github "tunnelblick", "1.0.8", :repo => "barklyprotects/puppet-tunnelblick"
github "usbethdriver", "1.0.0", :repo => "barklyprotects/puppet-usbethdriver"
github "vagrant",     "3.3.0"
github "virtualbox", "1.0.14", :repo => "barklyprotects/puppet-virtualbox"
github "vmware_fusion", "1.2.0"
github "wget",        "1.0.0"
github "zsh",         "1.0.0"
#PLEASE KEEP IN ALPHABETICAL ORDER. DON'T YOU DARE JUST APPEND TO THE BOTTOM!
