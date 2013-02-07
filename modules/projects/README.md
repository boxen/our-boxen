# Project Manifests

Project manifests live in `modules/projects/manifests/$project.pp`. A
simple project manifest example:

```puppet
class projects::trollin {
  include icu4c
  include phantomjs

  boxen::project { 'trollin':
    dotenv        => true,
    elasticsearch => true,
    mysql         => true,
    nginx         => true,
    redis         => true,
    ruby          => '1.9.3',
    source        => 'boxen/trollin'
  }
}
```

With the above, as long as our app is configured to listen on a **socket** at
`"#{ENV['BOXEN_SOCKET_DIR']}"/trollin`, you'll now be able to run its local
server and visit http://trollin.dev/ to access the app in dev.

For further documentation on how to use the `boxen::project` type,
take a look at the documentation in the
[source](https://github.com/boxen/puppet-boxen/blob/master/manifests/project.pp#L1-L46).
