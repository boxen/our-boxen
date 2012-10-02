# Personal Manifests

Per-user manifests live in `modules/people/manifests/LOGIN.pp`, where
`LOGIN` is a GitHub login. A simple user manifest example:

```puppet
class people::jbarnette {
  include emacs

  $home     = '/Users/jbarnette'
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  repository { $dotfiles:
    source  => 'jbarnette/dotfiles',
    require => File[$my]
  }
}
```
