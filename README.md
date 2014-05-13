# Odd Boxen

Odd Boxen is a web development environment for Mavericks based on [GitHubs Boxen](http://boxen.github.com).

This will automatically point any .dev domain to your locahost and enable dynamic virtual hosts for every folder in your ~/Sites folder. This means that you'll be able to setup a site by creating a folder, *example*, in your ~/Sites folder and access it from http://example.dev, or https://example.dev if you want to use a secure connection.


## What's included?

This is a list that points out the most relevant parts for this development environment. For a full list and further information, please refer to the repository for [our-boxen](https://github.com/boxen/our-boxen).

* Homebrew
* Git
* Node.js
  * Grunt CLI
* Ruby
  * Sass
* Drush
  * Registry Rebuild
* Apache configuration
  * Dynamic document root
  * Support for HTTPS
* PHP configuration
* MySQL
* MongoDB
* Solr


## Prerequisites

If you have any installations that are included within Odd Boxen, make sure that they are completely uninstalled before you continue. Don't forget to backup any personal data, such as MySQL databases, before you uninstall these services!

## Known issues

* When installing for the first time, you will se error messages like `Could not set 'file' on ensure: No such file or directory`. This is beacuse Odd Boxen is trying to create settings file for Solr before Solr has been installed. After the installation has finished, run `boxen` once again, and these files will be created.


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
	
	
	
3. When you're back at the prompt, restart the shell, and you should be able to run `boxen --env`. This will display the current status of the environment.

	If you can't run `boxen`, you'll need to add this line to the end of your *~/.profile* or *~/.bash_profile*:

	```
	source /opt/boxen/env.sh
	```
	Then restart your shell, and try to run `boxen --env` again.


## Updating

Simply run `boxen` from the terminal. This will automatically pull the latest changes from this repository, and perform any required alterations.
