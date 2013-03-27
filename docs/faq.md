# FAQ

Below you can find common questions and answers.

### Q: How do you uninstall an application and get it to reinstall in the application folder with boxen?

When removing applications make sure to remove the corresponding `/var/db/.puppet_appdmg_installed_application` so that boxen will reinstall it.

### Q: How do you remove Boxen?

Run `script/nuke` from inside the `/opt/boxen/repo` directory.
