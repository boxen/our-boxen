# Our Boxen

This is a template Boxen project designed for your organization to fork and
modify appropriately.
The Boxen rubygem and the Boxen puppet modules are only a framework for getting
things done.
This repository template is just a basic example of _how_ to do things with them.

## Getting Started

It's pretty important you follow these steps exactly.
You should not fork this repository for your organization's Boxen.
We have some pretty specific semantics about forking and public/private repositories.
We really recommend doing it this way:

1. Create a new local git repository. Create a private repository on GitHub under your organization for your boxen (eg. `myorg/myorg-boxen`)
1. In your new repository, `git remote add upstream https://github.com/boxen/our-boxen && git fetch upstream && git co -b master upstream/master`
1. Now follow the directions GitHub gave you when creating your private copy to push the master branch to your private copy.

With that done, now you can tweak it to your use:

1. Modify the `Puppetfile` and `modules/` to your heart's content.
1. Install the XCode Command Line Tools package. You need an Apple ID. We know. It sucks. You can thank Apple for not allowing the Command Line Tools to be redistributed publicly.
1. `cd` to that dir and run `script/boxen`
1. Ensure you have `[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh` in your shell config. If you don't have a shell config yet, we automatically add this to `~/.profile` for you.
1. Open a new shell.
1. Verify `boxen --env` prints out `BOXEN_` env vars.
1. Rock out. :metal:

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

You can always check out the number of existing modules we already provide as optional installs under the [boxen organization](https://github.com/boxen). These modules are all tested to be compatible with Boxen. You can include these modules by modifying the Puppetfile, adding them to `manifests/site.pp` if they should be installed on every machine, and then running `boxen`.

For your organization, it's recommended you create a module to contain the configuration in the `modules/` directory (eg. `modules/github`).
Then, you simply need to include that module in `manifests/site.pp`.

For organization projects (read: repositories that people will be working in), please see the documentation in the projects module template we provide.

For per-user configuration that doesn't need to be applied globally to everyone, please see the documentation in the people module template we provide.
