# Project Manifests

Project manifests live in `modules/projects/manifests/$project.pp`. A
simple project manifest example:

```puppet
class projects::boxen {
  $dir = "${boxen::config::srcdir}/boxen"

  repository { $dir:
    source  => 'boxen/boxen'
  }

  ruby::local { $dir:
    version => 'system',
    require => Repository[$dir]
  }
}
```
