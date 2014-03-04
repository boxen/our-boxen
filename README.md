# Odd Boxen

Odd Boxen is a web development environment for Mavericks based on [GitHubs Boxen](http://boxen.github.com).

This will automatically point any .dev domain to your locahost and enable dynamic virtual hosts for every folder in your ~/Sites folder. This means that you'll be able to setup a site by creating a folder, *example*, in your ~/Sites folder and access it from http://example.dev, or https://example.dev if you want to use a secure connection.


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
* Support for HTTPS
* PHP configuration
* MySQL
* Drush
* MongoDB


## Prerequisites

If you have any installations that are included within Odd Boxen, make sure that they are completely uninstalled before you continue. Don't forget to backup any personal data, such as MySQL databases, before you uninstall these services!


## Installation

1. Install Xcode Command Line Tools:

	```
	xcode-select --install
	```
	This will ask for your password, and initiate the installation if needed. All you need to do is to follow the instructions.



2. Run the following commands exactly as they say:

	```
	sudo mkdir -p /opt/boxen
	sudo chown ${USER}:staff /opt/boxen
	git clone git@github.com:oddhill/oddboxen.git /opt/boxen/repo
	cd /opt/boxen/repo
	script/boxen
	```
	Expect this to take a while.
	
	
	
3. When you're back at the prompt, restart the shell, and you should be able to run `boxen --env`. This wil display the current status of the environment. If you can't run `boxen`, you'll need to add this line to the end of your *~/.profile*:

	```
	[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
	```


## Updating

Simply run `boxen` from the terminal. This will automatically pull the latest changes from this repository, and perform any required alterations.
