# Our Boxen

This is CYLENT System's Boxen project, created from Github's Boxen template
project: https://github.com/boxen/our-boxen

See the template project for more detailed information on Boxen.

## Getting Started

The following sections will help:

* Install dependencies (basically Xcode)
* Bootstrap a boxen for yourself

There are a few potential conflicts to keep in mind.
Boxen does its best not to get in the way of a dirty system,
but you should check into the following before attempting to install your
boxen on any machine (we do some checks before every Boxen run to try
and detect most of these and tell you anyway):

* Boxen __requires__ at least the Xcode Command Line Tools installed.
* Boxen __will not__ work with an existing rvm install.
* Boxen __may not__ play nice with a GitHub username that includes dash(-)
* Boxen __may not__ play nice with an existing rbenv install.
* Boxen __may not__ play nice with an existing chruby install.
* Boxen __may not__ play nice with an existing homebrew install.
* Boxen __may not__ play nice with an existing nvm install.
* Boxen __recommends__ installing the full Xcode.

### Dependencies

#### Install Xcode
This will grant you the most predictable behavior in building apps like
MacVim.

How do you do it?

1. Install Xcode from the Mac App Store.
1. Complete the installation by opening the Xcode app, accepting the licentse agreement, and waiting until the installation completes.
1. Open a terminal, and run `xcode-select --install` to install the Xcode command line tools


#### CYLENT Github Organization
Ensure that your github account has been added to the CYLENT github organization, and that you have been added to the appropriate teams. Boxen requires access to some private CYLENT repositories, and so will fail if you don't have access.

If you received an email invitation to the CYLENT github organization, make sure that you have accepted the invitation before proceeding.

#### Enable FileVault
FileVault must be enabled prior to running boxen. After enabling FileVault, make sure to reboot before proceeding.

If you must run boxen without enabling FileVault (which should be avoided), you can run boxen with the `--no-fde` option.

### Bootstrapping

Run the following commands to bootstrap your boxen environment. This only needs
to be done once.

```
sudo mkdir -p /opt/boxen
sudo chown -R ${USER}:staff /opt/boxen
git clone https://github.com/barklyprotects/our-boxen.git /opt/boxen/repo
```

Next, create your user-specific boxen file from the default:

```
cd /opt/boxen/repo/modules/people/manifests
cp default.pp <your-github-username>.pp
```

Then open the newly created .pp file, and change the top line from "people::default" to "people::(your-github-username)"

Now that your boxen is bootstrapped, you can run the following to
install the default configuration from this repo. __Running boxen the first time will take awhile__.

```
cd /opt/boxen/repo
./script/boxen
```

Assuming that runs successfully, open a new tab/window in your Terminal
and you should be able to successfully run `boxen --env`.
If that runs cleanly, you're in good shape.

__Note that all repositories cloned by boxen will be placed in ~/cylent.__

At this point, you should be able to run `boxen` from a terminal to re-run boxen at any point. If you or someone else updates our boxen configuration, for example to add a new application, then running `boxen` should add the new application

### Adding projects
Common boxen configurations are encapsulated in projects. Configuring your machine for a particular project is as simple as adding that project to your personal boxen file. The projects that you add to your personal boxen file will be based on the type of work that you will be doing.

For example, someone that will be working on the endpoint (hypervisor or node layer) would add the endpoint project to their boxen file by adding this line:

```
include projects::endpoint
```

All available projects can be found at /opt/boxen/repo/modules/projects/manifests

You can stop reading here, and have a fully functioning boxen environment. Everything below is copied from Github's Boxen template project. Keep reading for additional information on using/customizing Boxen.

## Customizing

You can always check out the number of existing modules we already
provide as optional installs under the
[boxen organization](https://github.com/boxen). These modules are all
tested to be compatible with Boxen. Use the `Puppetfile` to pull them
in dependencies automatically whenever `boxen` is run.

### Including boxen modules from github (boxen/puppet-<name>)

You must add the github information for your added Puppet module into your Puppetfile at the root of your
boxen repo (ex. /path/to/your-boxen/Puppetfile):

    # Core modules for a basic development environment. You can replace
    # some/most of these if you want, but it's not recommended.

    github "repository", "2.0.2"
    github "dnsmasq",    "1.0.0"
    github "gcc",        "1.0.0"
    github "git",        "1.2.2"
    github "homebrew",   "1.1.2"
    github "hub",        "1.0.0"
    github "inifile",    "0.9.0", :repo => "cprice404/puppetlabs-inifile"
    github "nginx",      "1.4.0"
    github "nodejs",     "2.2.0"
    github "ruby",       "4.1.0"
    github "stdlib",     "4.0.2", :repo => "puppetlabs/puppetlabs-stdlib"
    github "sudo",       "1.0.0"

    # Optional/custom modules. There are tons available at
    # https://github.com/boxen.

    github "java",     "1.6.0"

In the above snippet of a customized Puppetfile, the bottom line
includes the Java module from Github using the tag "1.6.0" from the github repository
"[boxen/puppet-java/releases](https://github.com/boxen/puppet-java/releases)".  The function "github" is defined at the top of the Puppetfile
and takes the name of the module, the version, and optional repo location:

    def github(name, version, options = nil)
      options ||= {}
      options[:repo] ||= "boxen/puppet-#{name}"
      mod name, version, :github_tarball => options[:repo]
    end

Now Puppet knows where to download the module from when you include it in your site.pp or mypersonal.pp file:

    # include the java module referenced in my Puppetfile with the line
    # github "java",     "1.6.0"
    include java


### How Boxen interacts with Puppet

Boxen runs everything declared in `manifests/site.pp` by default.
But just like any other source code, throwing all your work into one massive
file is going to be difficult to work with. Instead, we recommend you
use modules in the `Puppetfile` when you can and make new modules
in the `modules/` directory when you can't. Then add `include $modulename`
for each new module in `manifests/site.pp` to include them.
One pattern that's very common is to create a module for your organization
(e.g., `modules/github`) and put an environment class in that module
to include all of the modules your organization wants to install for
everyone by default. An example of this might look like so:

``` puppet
# modules/github/manifests/environment.pp

 class github::environment {
   include github::apps::mac

   include ruby::1-8-7

   include projects::super-top-secret-project
 }
```

 If you'd like to read more about how Puppet works, we recommend
 checking out [the official documentation](http://docs.puppetlabs.com/)
 for:

 * [Modules](http://docs.puppetlabs.com/learning/modules1.html#modules)
 * [Classes](http://docs.puppetlabs.com/learning/modules1.html#classes)
 * [Defined Types](http://docs.puppetlabs.com/learning/definedtypes.html)
 * [Facts](http://docs.puppetlabs.com/guides/custom_facts.html)

### Creating a personal module

See [the documentation in the
`modules/people`](modules/people/README.md)
directory for creating per-user modules that don't need to be applied
globally to everyone.

### Creating a project module

See [the documentation in the
`modules/projects`](modules/projects/README.md)
directory for creating organization projects (i.e., repositories that people
will be working in).

## Binary packages

We support binary packaging for everything in Homebrew, rbenv, and nvm.
See `config/boxen.rb` for the environment variables to define.


## Halp!

See [FAQ](https://github.com/boxen/our-boxen/blob/master/docs/faq.md).

Use Issues or #boxen on irc.freenode.net.
