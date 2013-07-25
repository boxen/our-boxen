# FAQ

Below you can find common questions and answers.

### Q: How do you uninstall an application and get it to reinstall in the application folder with boxen?

When removing applications make sure to remove the corresponding `/var/db/.puppet_appdmg_installed_application` so that boxen will reinstall it.

### Q: How do you remove Boxen?

Run `script/nuke` from inside the `/opt/boxen/repo` directory.

### Q: What's a good approach to merging our-boxen back into my private fork?

One approach is to delete the Gemfile.lock and Puppetfile.lock and run:

    # Regenerates Gemfile.lock and installs new Gems
    bundle install --without development

    # Regenerates Puppetfile.lock and caches tarballs
    bundle exec librarian-puppet install --clean
    
These will generate the respective lock files suitable for committing. Hope that helps.
