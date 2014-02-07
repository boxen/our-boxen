# Odd Boxen

Odd Boxen is a web development environment for Mavericks based on [GitHubs Boxen](http://boxen.github.com).

This will automatically point any .dev domain to your locahost and enable dynamic virtual hosts for every folder in your ~/Sites folder. This means that you'll be able to setup a site by creating a folder, *example*, in your ~/Sites folder and access it from http://example.dev.


## What's included?

* Homebrew
* Git
* Hub
* dnsmasq
* rbenv
* Node.js 0.6
* Node.js 0.8
* Node.js 0.10
* Ruby 1.8.7
* Ruby 1.9.2
* Ruby 1.9.3
* Ruby 2.0.0
* ack
* Findutils
* GNU tar
* Apache configuration
* MySQL
* Drush


## Dependencies

This will only require that the Xcode Command Line Tools are installed. You can either install them by installing the full version of Xcode, or by running `xcode-select --install` from the terminal and follow the instructions.


## Installation

Run the following commands exactly as they say:

```
sudo mkdir -p /opt/boxen
sudo chown ${USER}:staff /opt/boxen
git clone git@github.com:oddhill/oddboxen.git /opt/boxen/repo
cd /opt/boxen/repo
script/boxen
```
Expect this to take a while. When you're back at the prompt, you should be able to run `boxen --env` in order to check the status for the current environment.


## Updating

Simply run `boxen` from the terminal. This will automatically pull the latest changes from this repository, and perform any required alterations.
