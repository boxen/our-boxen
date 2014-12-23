# FAQ

Below you can find common questions and answers.

### Q: Boxen Keychain Helper: Encountered error code: -25308
If you run `boxen` in a session without GUI (e.g. via SSH), you will most likely need to unlock the keychain manually.

```
security create-keychain -p $your_password $keychain_name
security default-keychain -d user -s $keychain_name
# if necessary..
security unlock-keychain -p $your_password # unlocks the default keychain, which boxen will use to store the token
```

### Q: How do you uninstall an application and get it to reinstall in the application folder with boxen?

When removing applications make sure to remove the corresponding `/var/db/.puppet_appdmg_installed_application` so that boxen will reinstall it.

### Q: How do you remove Boxen?

Run `script/nuke` from inside the `/opt/boxen/repo` directory.

### Q: How do you upgrade your boxen from the public our-boxen?
Anwser distilled from http://grahamgilbert.com/blog/2014/04/04/updating-boxen/
As Boxen is made by GitHub, updating it is much like updating any other project on there that you’ve made a fork of. First we’re going to add it as a remote repository:

```bash
cd ~/src/our-boxen
git remote add upstream https://github.com/boxen/our-boxen.git
```
Then we’re going to fetch the stuff from the upstream repository:

```bash
git fetch upstream
```

Now we’re going to merge the updated repository with our own:

```bash
git checkout master
git merge upstream/master
```

Now deal with conflicts in (Puppetfile, manifests/site.pp), ignore any diffs in Puppetfile.lock and Gemfile.lock.


```bash
git mergetool
```

The next step is to update your Puppet modules and RubyGems. First delete Puppetfile.lock and Gemfile.lock. Now go back to your trusty Terminal and:

```bash
rm Puppetfile.lock Gemfile.lock
bundle install --no-deployment --without development --path .bundle
bundle exec librarian-puppet install --clean
```


### Q: What's a good approach to merging our-boxen back into my private fork?

One approach is to delete the Gemfile.lock and Puppetfile.lock and run:

    # Regenerates Gemfile.lock and installs new Gems
    bundle install --without development --path .bundle

    # Regenerates Puppetfile.lock and caches tarballs
    bundle exec librarian-puppet install --clean

These will generate the respective lock files suitable for committing. Hope that helps.

### Q: Should you keep the cache of the module and gem in the repository?

We recommend you to keep the files inside `vendor/cache` and `vendor/puppet/cache` inside
the repository.

It ends up adding a negligible amount of disk space in return for much faster runtimes
for other folks on your team (since they don't have to fetch the tarballs one-by-one
through the GitHub API any time a module version changes).
