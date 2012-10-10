# Our Boxen

This is a template Boxen project designed for your organization to fork and
modify appropriately.
The Boxen rubygem and the Boxen puppet modules are only a framework for getting
things done.
This repository template is just a basic example of _how_ to do things with them.

## Getting Started

1. Install XCode Command Line Tools and/or full XCode.
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
in dependencies automatically whenever `boxen` is run. 

### Node Definitions ###

Puppet has the concept of a ['node'](http://docs.puppetlabs.com/references/glossary.html#agent), which is essentially the machine on which Puppet is running. Puppet looks for [node definitions](http://docs.puppetlabs.com/learning/agent_master_basic.html#node-definitions) in the `manifests/site.pp` file in the Boxen repo. You'll see a default node declaration that looks like the following:

    node default {
      # core modules, needed for most things
      include dnsmasq
      <...>
    }

All Puppet [class declarations](http://docs.puppetlabs.com/learning/modules1.html#classes) should be included in the default node definition.  Theoretically, you _COULD_ declare every [Puppet resource](http://docs.puppetlabs.com/learning/ral.html) in the `manifests/site.pp` file, but that would quickly become unwieldy. Instead, it's easier to create [Puppet modules](http://docs.puppetlabs.com/learning/modules1.html#modules) inside the `modules` folder of the Boxen repo. Boxen is setup to discover any modules you create in the `modules` folder, and we've already created a `people` and `projects` module structure for you to start using.

### Creating a personal module ###

Using the `modules/people` folder that's been provided in the Boxen repo, start by creating a file in `modules/people/manifests` in the format of `your_last_name.pp` (Feel free to use the [Puppet module cheat sheet](http://docs.puppetlabs.com/module_cheat_sheet.pdf) if you need some extra help). If we were making a module for [Tim Sharpe](http://github.com/rodjek), we would create a file called `modules/people/manifests/sharpe.pp` that would look like the following:

    # modules/people/manifests/sharpe.pp
    class people::sharpe {
      # Resource Declarations go here
      package { 'tree':
        ensure   => installed,
        provider => homebrew,
      }
    }

This class is installing the `tree` package out of
[Homebrew](https://github.com/mxcl/homebrew), but feel free to add whatever
resource declarations you'll need.  Finally, add the following line in the
`manifests/site.pp` file within the default node definition:

    include people::sharpe

Finally, run `boxen --noop` to [simulate, or
test](http://docs.puppetlabs.com/guides/tests_smoke.html#running-tests) what
changes your code would have made. If you're happy with how things look, you
can then run `boxen` to enforce the changes you've made

You'll have to
make sure your "node" (Puppet's term for your laptop, basically)
includes or requires them. You can do this by either modifying
`manifests/site.pp` for each module, _or_ we would generally recommend
you create a module for your organization (eg. `modules/github`) and
create an environment class in that. Then you need only adjust
`manifests/site.pp` by doing `include github::environment` or
what-have-you for your organization.

### Creating a project module ###

The `modules/projects` folder is provided for organizational projects that
aren't specific to one person. You're free to create any number of modules in
the `modules` directory. As long as you follow Puppet's module naming patterns,
everything should be fine. For more information, see the documentation in the
projects module template that we provide.

## Binary packages

We support binary packaging for everything in Homebrew, RBEnv, and NVM.
See `config/boxen.rb` for the environment variables to define.
