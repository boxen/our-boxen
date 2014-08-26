# Boxen Linux

A version of GitHub's our-boxen that works on both Linux and OSX. Has been tested on OSX 10.9.4 and Ubuntu 14.04.

## Motivation

Linuxbrew, the Linux fork of homebrew, has been coming along nicely. As homebrew was the key missing dependency for a version of boxen on Linux, now seems like a good time to make a Linux version of boxen based around linuxbrew.

## Extra instructions

- The bootstrap script now installs the boxen-linux dependencies, but if you don't already have git it can be difficult to get ahold of boxen-linux in the first place. Here's how to install it on a fresh installation of Ubuntu 14.04:
```
sudo apt-get -y update
sudo apt-get -y install git-core
sudo mkdir -p /opt/boxen
sudo chown "${USER}":${USER} /opt/boxen
git clone https://github.com/boxen/our-boxen.git /opt/boxen/repo
cd /opt/boxen/repo
script/bootstrap
script/boxen --no-fde --debug
```
- Linuxbrew functions completely identically to homebrew, so if you want to add your own homebrew-sourced packages you can do so in your manifests in exactly the same way as you would for vanilla boxen:
```
package { '<homebrew-formula-name>': }
```
- As of right now, boxen-linux is only guaranteed to work on OSX and Ubuntu 14.04. It might run on other versions of Ubuntu, and there's a good chance that it will run on other subflavors of Debian Linux (at least with a few minor tweaks), but there is no possibility whatsoever that it will run on a flavor of Linux that doesn't rely on apt packaging.

## Features

As of right now, these are the boxen modules which I've modded Linux support into

- puppet-boxen 		(:repo => "telamonian/puppet-boxen")
- puppet-eclipse 	(:repo => "telamonian/puppet-eclipse")
- puppet-gcc 		(:repo => "telamonian/puppet-gcc")
- puppet-git 		(:repo => "telamonian/puppet-git")
- puppet-homebrew 	(:repo => "telamonian/puppet-homebrew")
- puppet-hub 		(:repo => "telamonian/puppet-hub")
- puppet-java 		(:repo => "telamonian/puppet-java")
- puppet-ruby 		(:repo => "telamonian/puppet-ruby")

## Thing to be aware of
- In order to deal with the difference in paths between OSX and Linux, boxen-linux creates a few directories and symlinks that vanilla boxen does not
  -directories
    -/User
    -/var/db
  -symlinks
    -/User/${USER} -> /home/${USER}

## Still to come
- Support for more versions of Linux
- Support for more modules

## Potential sources of bugs
- If you want to deploy boxen on both OSX and Linux, you need to keep two versions of the facter gem in your vender/cache directory, facter-x.x.x.gem and facter-x.x.x-universal-darwin.gem. If you're running on OSX and you only have facter-x.x.x.gem, Puppet tries to use it and crashes.

## Notes on writing boxen ports
- A pretty good regex for finding platform specific lines of code in a module:
```
(?i)(?:plist)|(:?service)|(?:RUBY_PLATFORM)|(?:osfamily)|(?:wheel)|(?:staff)
```