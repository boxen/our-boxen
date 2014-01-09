class people::awaxa::preferences {

  osx::recovery_message { "If found, please email greg.kitson@gmail.com": }

  include osx::global::disable_remote_control_ir_receiver

  include osx::dock::clear_dock
  include osx::dock::autohide
  include osx::dock::disable

  include osx::finder::unhide_library

  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update

  boxen::osx_defaults {
    'Globally Disable Autocorrect':
      user   => "${::boxen_user}",
      key    => 'NSAutomaticSpellingCorrectionEnabled',
      domain => 'NSGlobalDomain',
      value  => '0';
    'Disable Dashboard':
      user   => "${::boxen_user}",
      key    => 'mcx-disabled',
      domain => 'com.apple.dashboard',
      value  => '1';
  }
}
