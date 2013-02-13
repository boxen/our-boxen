# Writing Puppet modules for Boxen

Writing Puppet modules for Boxen is easy.

## Tooling

* Always use Bundler
* Always use librarian-puppet
* Always use puppet-lint
* Always use rspec-puppet

## Directory structure

We follow Puppet's recommended structure very closely.
Here's the directory structure from the boxen Puppet module:

```
├── Gemfile
├── Gemfile.lock
├── README.md
├── files
│   ├── README.md
│   └── gemrc
├── lib
│   ├── facter
│   │   ├── boxen.rb
│   │   └── root_encrypted.rb
│   └── puppet
│       ├── parser
│       │   └── functions
│       │       ├── file_exists.rb
│       │       ├── include_all_projects.rb
│       │       └── include_projects_from_boxen_cli.rb
│       ├── provider
│       │   ├── package
│       │   │   ├── compressed_app.rb
│       │   │   ├── hax.rb
│       │   │   └── homebrew.rb
│       │   ├── repository
│       │   │   └── git.rb
│       │   └── service
│       │       └── ghlaunchd.rb
│       └── type
│           └── repository.rb
├── manifests
│   ├── bin.pp
│   ├── config.pp
│   ├── development
│   │   └── project.pp
│   ├── development.pp
│   ├── environment.pp
│   ├── gemrc.pp
│   ├── janitor.pp
│   ├── osx_defaults.pp
│   ├── personal.pp
│   ├── profile.pp
│   ├── project.pp
│   ├── repo.pp
│   ├── security.pp
│   ├── sudoers.pp
│   └── zipped_widget.pp
├── script
│   ├── bootstrap
│   ├── cibuild
│   ├── lint
│   ├── specs
│   └── syntax
├── spec
│   ├── classes
│   │   ├── bin_spec.rb
│   │   └── environment_spec.rb
│   ├── fixtures
│   │   ├── Puppetfile
│   │   ├── Puppetfile.lock
│   │   ├── manifests
│   │   │   └── site.pp
│   │   └── modules
│   │       ├── boxen
│   │       │   ├── files -> ../../../../files
│   │       │   ├── lib -> ../../../../lib
│   │       │   ├── manifests -> ../../../../manifests
│   │       │   └── templates -> ../../../../templates
│   │       └── projects
│   │           └── manifests
│   │               └── test.pp
│   ├── spec_helper.rb
│   └── unit
│       └── puppet
│           └── type
│               └── repository_spec.rb
└── templates
    ├── config.sh.erb
    ├── env.sh.erb
    └── gh_creds.sh.erb
```

Of note, we do not use things like `rake` to drive specs.
Instead, we bias towards simple, portable shell scripts that can be consumed
by other shell scripts.

## Facts and variables

The core boxen module provides [a number of variables to use](https://github.com/boxen/puppet-boxen/blob/master/manifests/config.pp#L2-L14).

In addition to these, you may always assume the presence of a `boxen_user` fact,
which is the local user running Boxen.

Other modules may provider their own globally available variables.
The recommendation is to put any variables that might be consumed by
multiple classes/manifests should be in a scoped config class
(e.g. `modules/boxen/manifests/config.pp`).
