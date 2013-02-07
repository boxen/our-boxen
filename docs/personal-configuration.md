# Personal Configuration

One of the design choices of Boxen very early on was that we didn't want to
dictate down to users "you can do this, but you can't do that".
We do so as little as possible in the core, and we don't do it at all for
per-user configurations.

How? The personal manifest.

Personal manifests live in `modules/people/manifests/<name>.pp`,
where `<name>` is your GitHub username.
A basic personal manifest might look like so:

``` puppet
class people::wfarr {
  notify { 'hello world': }
}
```

Now, each time `wfarr` runs Boxen it'll automatically print out "hello world"
somewhere during the run.
You can even run `boxen-my-config` to generate a default template for you
and open it up in your editor.
When you're done, you can simply run `boxen` and it'll include your changes
in your personal manifest.
**You should always keep your manifest committed and pushed to your repository**.
Otherwise, auto-updates won't work!

The whole point of these personal manifest are they are _your_ manifest.
You shouldn't worry if the things in here are work-related or not.
This is about full automation.
Want to install Minecraft and Rdio by default?
Do it in your personal manifest.

You can check out the [projects README](../modules/projects/README.md) for further examples.
