# Odd Boxen

Odd Boxen is a web development environment for Mavericks based on [GitHubs Boxen](http://boxen.github.com).

This will automatically point any .dev domain to your locahost and enable dynamic virtual hosts for every folder in your ~/Sites folder. This means that you'll be able to setup a site by creating a folder, *example*, in your ~/Sites folder and access it from http://example.dev, or https://example.dev if you want to use a secure connection.


## What's included?

This is a list that points out the most relevant parts for this development environment. For a full list and further information, please refer to the repository for [our-boxen](https://github.com/boxen/our-boxen).

* Homebrew
* Git
* Node.js
  * Grunt CLI
  * Bower
  * Yeoman
  * JSHint
* Ruby
  * Sass
* Drush
  * Registry Rebuild
* Apache configuration
  * Dynamic document root
  * Support for HTTPS
* PHP configuration
* Postfix relay for Mandrill
* MySQL
* MongoDB
* Solr


## Prerequisites

If you have any installations that are included within Odd Boxen, make sure that they are completely uninstalled before you continue. Don't forget to backup any personal data, such as MySQL databases, before you uninstall these services!

## Known issues

Actually, none. Please [file an issue](https://github.com/oddhill/oddboxen/issues/new) if you experience any problems. Make sure to read the [Troubleshooting](#troubleshooting) section first though, as this may solve your problems.


## Installation

1. Install Xcode Command Line Tools:

	```
	xcode-select --install
	```
	This will ask for your password, and initiate the installation if needed. All you need to do is to follow the instructions.
	
	
	
2. Install [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12), and start Xcode in order to approve to the terms of use.



3. Run the following commands exactly as they say:

	```
	sudo mkdir -p /opt/boxen
	sudo chown ${USER}:staff /opt/boxen
	git clone https://github.com/oddhill/oddboxen.git /opt/boxen/repo
	cd /opt/boxen/repo
	```



4. Create the Mandrill manifest:

   ```
   cp puppet-postfix/manifests/mandrill.pp.default puppet-postfix/manifests/mandrill.pp
   ```



5. Edit the Mandrill manifest with your favorite editor, e.g:

   ```
   pico puppet-postfix/manifests/mandrill.pp
   ```

   Enter the credentials for your [Mandrill account](https://mandrillapp.com).



6. Install Odd Boxen:

   ```
   script/boxen
   ```

   Expect this to take a while.




7. When you're back at the prompt, restart the shell, and you should be able to run `boxen --env`. This will display the current status of the environment.

	If you can't run `boxen`, you'll need to add this line to the end of your *~/.profile* or *~/.bash_profile*:

	```
	source /opt/boxen/env.sh
	```
	Then restart your shell, and try to run `boxen --env` again.



## Updating

1. Run `brew update && brew upgrade` in order to update and upgrade all formulas and brews.

2. Run `boxen` from the terminal. This will automatically pull the latest changes from this repository, and perform any required alterations.



## Troubleshooting

* Run `brew update && brew upgrade` in order to update and upgrade all formulas and brews.

* Run `brew doctor` in order to check for any errors related to Homebrew. Take any actions necessary.

* Make sure that Xcode is updated. Check the App Store for available updates.

* Run `xcode-select --install` in order to update Xcode Command Line Tools.