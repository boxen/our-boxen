# Toggle the dock autohide time modifier setting
class cylent::osx::dock::autohide-time-modifier($value = 0) {
  include osx::dock

  boxen::osx_defaults {'Change dock autohide timer':
    user    => $::boxen_user,
    key     => 'autohide-time-modifier',
    domain  => 'com.apple.dock',
    value   => $value,
    type    => int,
    notify  => Exec['killall Dock'];
  }
}
