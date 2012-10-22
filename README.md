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
  git checkout -b master upstream/master
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

## Getting your users started _after_ your "fork" exists

1. Install the XCode Command Line Tools (full XCode install optional).
1. Run the following:

```
sudo mkdir -p /opt/boxen
sudo chown $USER:admin /opt/boxen
git clone https://github.com/yourorg/yourreponame.git /opt/boxen/repo
cd /opt/boxen/repo
script/boxen

# add boxen to your shell config, at the end, eg.
echo '[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh'
```

Open a new terminal, `boxen --env` to confirm.

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
in dependencies automatically whenever `boxen` is run. 

### Node definitions

Puppet has the concept of a 
['node'](http://docs.puppetlabs.com/references/glossary.html#agent), 
which is essentially the machine on which Puppet is running. Puppet looks for 
[node definitions](http://docs.puppetlabs.com/learning/agent_master_basic.html#node-definitions) 
in the `manifests/site.pp` file in the Boxen repo. You'll see a default node 
declaration that looks like the following:

``` puppet
node default {
  # core modules, needed for most things
  include dnsmasq

  # more...
}
```

### How Boxen interacts with Puppet

Boxen runs everything declared in `manifests/site.pp` by default. 
But just like any other source code, throwing all your work into one massive 
file is going to be difficult to work with. Instead, we recommend you 
use modules via the `Puppetfile` when you can and making new modules 
in the `modules/` directory when you can't. Then you just need to 
`include $modulename` those modules in `manifests/site.pp`. One pattern 
that's very common is to create a module for your organization 
(eg. `modules/github`) and put an environment class in that module 
to include all of the modules your organization wants to install for 
everyone by default. An example of this might look like so:

``` puppet
# modules/github/manifests/environment.pp

 class github::environment {
   include github::apps::mac

   include ruby::1-8-7

   include projects::super-top-secret-project
 }
 ```

 If you'd like to read more about how Puppet  works, we recommend 
 checking out [the official documentation](http://docs.puppetlabs.com/) 
 for:

 * [Modules](http://docs.puppetlabs.com/learning/modules1.html#modules)
 * [Classes](http://docs.puppetlabs.com/learning/modules1.html#classes)
 * [Defined Types](http://docs.puppetlabs.com/learning/definedtypes.html)
 * [Facts](http://docs.puppetlabs.com/guides/custom_facts.html)

### Creating a personal module

See [the documentation in the
`modules/people`](https://github.com/boxen/our-boxen/blob/master/modules/people/README.md)
directory for creating per-user modules that don't need to be applied
globally to everyone.

### Creating a project module

See [the documentation in the
`modules/projects`](https://github.com/boxen/our-boxen/blob/master/modules/projects/README.md)
directory for creating organization projects (read: repositories that people
will be working in).

## Binary packages

We support binary packaging for everything in Homebrew, RBEnv, and NVM.
See `config/boxen.rb` for the environment variables to define.
