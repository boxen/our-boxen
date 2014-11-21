# Toggle the minimize windows to application dock icon setting
class cylent::osx::dock::minimize_to_application($enabled = true) {
  include osx::dock

  boxen::osx_defaults {'Toggle minimize to application dock icon setting':
    user    => $::boxen_user,
    key     => 'minimize-to-application',
    domain  => 'com.apple.dock',
    value   => $enabled,
    notify  => Exec['killall Dock'];
  }
}
