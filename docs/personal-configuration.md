# Personal Configuration

One of the design choices of Boxen very early on was that we didn't want to
dictate down to users "you can do this, but you can't do that".
We do so as little as possible in the core, and we don't do it at all for
per-user configurations.

How? The personal manifest.

## What even is a personal manifest?

Personal manifests live in `modules/people/manifests/<name>.pp`,
where `<name>` is your GitHub username.

The simplest personal manifest looks like this:

``` puppet
class people::wfarr {
  notify { 'hello world': }
}
```

Ah, the good old "Hello World".
It's boring, but you can see there's really not much boilerplate involved.
Let's try something *real* this time:

``` puppet
class people::wfarr {
  include boxen::development
}
```

So what does this do?
It clones every repo in the Boxen org to `~/src/boxen/<repo>`.
How?
Well, we can refer to [the source code](https://github.com/boxen/puppet-boxen/blob/master/manifests/development.pp)!
If you're new to Puppet, or are unsure of what that class is doing, check out
the [intro to puppet](./puppet.md) we've put together.

## Running different code on multiple machines

Puppet has conditionals and switching.
Typically, the most reliable way to ensure some code runs on one machine but not
others is to use the `case` statement on the `hostname` fact.
Example:

``` puppet
case $::hostname {
  'scruffy': {
    notify { "I'm Scruffy. The Janitor.": }
  }

  'bender': {
    notify { "My full name is Bender Bending Rodriguez": }
  }

  default: {
    notify { "Wha?": }
  }
}
```

One thing to note here is that Puppet always **requires** a default path
on a case statement.
Default is equivalent to "anything that isn't matched above".
