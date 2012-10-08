# Our Boxen

This is a template Boxen project designed for your organization to fork and
modify appropriately.

## Getting Started

1. Fork this repository.
2. Modify the `Puppetfile` and `modules/` to your heart's content.
3. Get a copy of your fork somewhere locally.
4. Install the XCode Command Line Tools package. You need an Apple ID. We know. It sucks. You can thank Apple for not allowing the Command Line Tools to be redistributed publicly.
5. `cd` to that dir and run `script/boxen`
6. Rock out. :metal:

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