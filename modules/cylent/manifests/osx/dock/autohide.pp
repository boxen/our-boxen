# Toggle the dock autohide setting
class cylent::osx::dock::autohide($enabled = true) {
  include osx::dock

  boxen::osx_defaults {'Toggle dock autohide setting':
    user    => $::boxen_user,
    key     => 'autohide',
    domain  => 'com.apple.dock',
    value   => $enabled,
    notify  => Exec['killall Dock'];
  }
}
