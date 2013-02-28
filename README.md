# Our Boxen

This is a template Boxen project designed for your organization to fork and
modify appropriately.
The Boxen rubygem and the Boxen puppet modules are only a framework for getting
things done.
This repository template is just a basic example of _how_ to do things with them.

## Getting Started

1. Install Xcode Command Line Tools and/or full Xcode.
  * If using full Xcode, you'll need to agree to the license by running: `xcodebuild -license`
1. Create a new repository on GitHub as your user for your Boxen. (eg.
`wfarr/my-boxen`). **Make sure it is a private repository!**
1. Use your install of [boxen-web](https://github.com/boxen/boxen-web) or get running manually like so:
  ```
  sudo mkdir -p /opt/boxen
  sudo chown ${USER}:admin /opt/boxen
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

1. Install the Xcode Command Line Tools (full Xcode install optional).
1. Point them at your private install of [boxen-web](https://github.com/boxen/boxen-web), **OR** have them run the following:

```
sudo mkdir -p /opt/boxen
sudo chown ${USER}:admin /opt/boxen
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

### Including boxen modules from github (boxen/puppet-<name>)

You must add the github information for your added Puppet module into your Puppetfile at the root of your
boxen repo (ex. /path/to/your-boxen/Puppetfile):

    # Core modules for a basic development environment. You can replace
    # some/most of these if you want, but it's not recommended.

    github "dnsmasq",  "1.0.0"
    github "gcc",      "1.0.0"
    github "git",      "1.0.0"
    github "homebrew", "1.0.0"
    github "hub",      "1.0.0"
    github "inifile",  "0.9.0", :repo => "cprice-puppet/puppetlabs-inifile"
    github "nginx",    "1.0.0"
    github "nodejs",   "1.0.0"
    github "nvm",      "1.0.0"
    github "ruby",     "1.0.0"
    github "stdlib",   "3.0.0", :repo => "puppetlabs/puppetlabs-stdlib"
    github "sudo",     "1.0.0"
    
    # Optional/custom modules. There are tons available at
    # https://github.com/boxen.
    
    github "java",     "1.0.5"
    
In the above snippet of a customized Puppetfile, the bottom line 
includes the Java module from Github using the tag "1.0.5" from the github repository 
"boxen/puppet-java".  The function "github" is defined at the top of the Puppetfile 
and takes the name of the module, the version, and optional repo location:

    def github(name, version, options = nil)
      options ||= {}
      options[:repo] ||= "boxen/puppet-#{name}"
      mod name, version, :github_tarball => options[:repo]
    end

Now Puppet knows where to download the module from when you include it in your site.pp or mypersonal.pp file:

    # include the java module referenced in my Puppetfile with the line
    # github "java",     "1.0.5"
    include java

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
use modules in the `Puppetfile` when you can and make new modules 
in the `modules/` directory when you can't. Then add `include $modulename` 
for each new module in `manifests/site.pp` to include them. 
One pattern that's very common is to create a module for your organization 
(e.g., `modules/github`) and put an environment class in that module 
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

 If you'd like to read more about how Puppet works, we recommend 
 checking out [the official documentation](http://docs.puppetlabs.com/) 
 for:

 * [Modules](http://docs.puppetlabs.com/learning/modules1.html#modules)
 * [Classes](http://docs.puppetlabs.com/learning/modules1.html#classes)
 * [Defined Types](http://docs.puppetlabs.com/learning/definedtypes.html)
 * [Facts](http://docs.puppetlabs.com/guides/custom_facts.html)

### Creating a personal module

See [the documentation in the 
`modules/people`](modules/people/README.md)
directory for creating per-user modules that don't need to be applied
globally to everyone.

### Creating a project module

See [the documentation in the
`modules/projects`](modules/projects/README.md)
directory for creating organization projects (i.e., repositories that people
will be working in).

## Binary packages

We support binary packaging for everything in Homebrew, RBEnv, and NVM.
See `config/boxen.rb` for the environment variables to define.

## Halp!

Use Issues or #boxen on irc.freenode.net.
