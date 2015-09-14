# Personal Manifests

Per-user manifests live in `modules/people/manifests/$login.pp`, where
`$login` is your BarklyProtects username. A simple user manifest example:

```puppet
class people::jbarnette {
  include emacs   # requires emacs module in Puppetfile
  include sparrow # requires sparrow module in Puppetfile

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'jbarnette/dotfiles',
    require => File[$my]
  }
}
```

## Projects

While you _can_ include projects one by one, sometimes you might just want
all of them.
You can do that easily with:

```
include projects::all
```
