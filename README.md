# Our Boxen

This is a template Boxen project designed for your organization to fork and
modify appropriately.
The Boxen rubygem and the Boxen puppet modules are only a framework for getting
things done.
This repository template is just a basic example of _how_ to do things with them.

## Getting Started

1. Install XCode Command Line Tools and/or full XCode.
  * If using full XCode, you'll need to agree to the license by running: `xcodebuild -license`
1. Create a new repository on GitHub as your user for your Boxen. (eg.
`wfarr/my-boxen`). **Make sure it is a private repository!**
1. Get running like so:
  ```
  mkdir -p ~/src/my-boxen
  cd ~/src/my-boxen
  git init
  git remote add upstream https://github.com/boxen/our-boxen
  git fetch upstream
  git co -b master upstream/master
  git remote add origin https://github.com/wfarr/my-boxen
  git push origin master
  
  script/boxen
  ```
1. Close and reopen your Terminal. If you have a shell config file
(eg. `~/.bashrc`) you'll need to add this at the very end:
`[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh`, and reload
your shell.
1. Confirm the Boxen env has loaded: `boxen --env`

Now you have your own my-boxen repo that you can hack on.
You may have noticed we didn't ask you to fork the repo.
This is because when our-boxen goes open source that'd have some
implications about your fork also potentially being public.
That's obviously quite bad, so that's why we strongly suggest you
create an entirely separate repo and simply pull the code in, as shown above.

## What You Get

This template project provides the following by default:

* Homebrew
* Git
* Hub
* DNSMasq w/ .dev resolver for localhost
* NVM
* RBenv
* Full Disk Encryption requirement
* NodeJS 0.4
* NodeJS 0.6
* NodeJS 0.8
* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3
* Ack
* Findutils
* GNU-Tar

## Customizing

You can always check out the number of existing modules we already
provide as optional installs under the
[boxen organization](https://github.com/boxen). These modules are all
tested to be compatible with Boxen. Use the `Puppetfile` to pull them
in dependencies automatically whenever `boxen` is run. You'll have to
make sure your "node" (Puppet's term for your laptop, basically)
includes or requires them. You can do this by either modifying
`manifests/site.pp` for each module, _or_ we would generally recommend
you create a module for your organization (eg. `modules/github`) and
create an environment class in that. Then you need only adjust
`manifests/site.pp` by doing `include github::environment` or
what-have-you for your organization.

For organization projects (read: repositories that people will be working in), please see the documentation in the projects module template we provide.

For per-user configuration that doesn't need to be applied globally to everyone, please see the documentation in the people module template we provide.

## Binary packages

We support binary packaging for everything in Homebrew, RBEnv, and NVM.
See `config/boxen.rb` for the environment variables to define.
