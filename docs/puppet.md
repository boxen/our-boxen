# wtf is a puppet?

Puppet is configuration management tool, written in Ruby, that compiles
and runs code written in the Puppet language.

But what does that actually mean in words a human can understand?
Puppet is a tool that runs some code and that code can do all sorts of
really powerful things to configure computers for you.

Why do I want code mucking about with my laptop though?
For the exact same reasons you want code configuring your server.
In particular, homogeneity, reproducibility, reusability, and automation.
When you use code to express how a machine should be configured,
you know that all of your machines are configured the same way,
that you can repeat that configuration any number of times,
and that you don't have to do it manually each time.

## How does Puppet work?

A Puppet run has two main steps: compilation and application.

The compilations step starts with reading in what's called the site manifest.
The site manifest is a single file that contains Puppet code that is responsible
for telling the compiler what other Puppet code it should compile.

Here are the first few lines of the default site manifest for Boxen:

```
include boxen::environment
include homebrew
include gcc
```

This tells the Puppet compiler that it must include the classes
`boxen::environment`, `homebrew`, and `gcc`.
Puppet will look for those classes on the modulepath.
Typically, these files would be located at
`$modulepath/boxen/manifests/environment.pp` and
`$modulepath/homebrew/manifests/init.pp`.

These might include other classes as well, or define **resources**.
Resources are the building blocks of Puppet.
A resource is an abstract description about a **thing** and the **state**
that thing should be in.
Every resource has a **type**, which is just a classification of resources.
For example, we might have a resource `Package[mysql]` and its type would be
`Package`.
Puppet also supports multiple providers for types which act as pluggable
backends depending on the operating system it's running on or the tools
available on a particular system (in the case of the `Package` type,
we might have providers for `yum` and for `aptget`).

So now the Puppet compiler has finished tracking down and loading all the
classes and resources it needs.
Assuming we haven't encountered any compile-time errors, Puppet then begins
the next phase of a run: applying the catalog.

All of the resources Puppet has collected into the catalog have formed a
DAG (directed, acyclic graph) that represents the order in which all these
resources can be applied in a correct order.
Puppet simply grabs the first "node" in this graph and traverses all nodes
in the graph, applying each resource as it goes.

Application of an individual resource starts with Puppet asking "is this
resource in the state requested?" If the answer is yes, Puppet moves onto the
next node and repeats this process. If the answer is no, Puppet will make
whatever changes it can to reconcile the current state of the resource with
what it should be, and then continues on.

Once all resources have been applied, the Puppet run is complete.

## Declarative by nature

One of the most confusing parts of the Puppet language to many newcomers is
how the Puppet catalog orders and applies resources.
The key thing to remember is that Puppet is a **declarative** language rather
than a procedural one.
In human words, the only order that matters in Puppet is order specified by
relationships between resources.

Here's an example of how someone new to Puppet might write a class:

``` puppet
class mysql {
  file    { '/etc/my.cnf': source => 'puppet:///modules/mysql/my.cnf.erb' ; }
  package { 'mysql': }
  service { 'mysql': }
}
```

Someone expecting Puppet to be procedural would read this manifest as a list
saying:

* First create the my.cnf file
* Then install the mysql package
* Then start the mysql service

The problem is, they would be **wrong**.
There is no guarantee Puppet will apply these resources in that order,
and it's quite likely that it won't.

The proper way to ensure ordering in Puppet is to use one of the four
**relationship metaparameters**:

* before - Run this resource before another resource
* notify - Same as before, but triggers a refresh on that resource
* require - Run this resource after another resource
* subscribe - Same as require, but triggers a refresh on that resource

The behavior of these metaparameters should be pretty clear.
Triggering a resource simply means that a resource will "refresh" itself.
That typically means something like a `Service` resource restarting itself.
It's important to remember that these metaparameters are valid on **any** resource.

So, let's rewrite our example properly:

``` puppet
class mysql {
  file { '/etc/my.cnf':
    source => 'puppet:///modules/mysql/my.cnf.erb',
    notify => Service['mysql']
  }

  package { 'mysql':
    notify => Service['mysql']
  }

  service { 'mysql': }
}
```

Now we're telling Puppet what order to apply these resources in:

* Make sure /etc/my.cnf is in place before we start the mysql service
* If /etc/my.cnf changes, tell mysql to restart
* Make sure the mysql package is in place before we start the mysql service
* If the mysql package changes, tell mysql to restart

It's important to note that we didn't tell Puppet if `File[/etc/my.cnf]`
should come before or after `Package[mysql]`.
This is intentional.
Most package managers won't overwrite a configuration file that already exists
at package install-time, so in this case, we can assume installing the mysql
package won't clobber our custom `/etc/my.cnf` file.
