# Bootstrap hooks

The bootstrap script will execute any executable files in this directory.  This
will give you an opportunity to run logic against dependencies of boxen before
the puppet environment is loaded.

These scripts will be run every time boxen is executed so be sure to check to
see if the script should be executed before running a computationally heavy
script.

Directories are safe to include but will not be traversed.
