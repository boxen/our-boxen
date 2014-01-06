class people::awaxa::preferences {

  osx::recovery_message { "If found, please email greg.kitson@gmail.com": }

  include osx::global::disable_remote_control_ir_receiver

  include osx::dock::clear_dock
  include osx::dock::autohide
  include osx::dock::disable

  include osx::finder::show_hidden_files

  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update

  boxen::osx_defaults { 'Globally Disable Autocorrect':
    user   => "${::boxen_user}",
    key    => 'NSAutomaticSpellingCorrectionEnabled',
    domain => "'Apple Global Domain'",
    value  => '0';
  }

  # this did not work
  #boxen::osx_defaults { 'Lower Left Hot Corner: Start Screen Saver':
  #  user   => "${::boxen_user}",
  #  key    => 'wvous-bl-corner',
  #  domain => 'com.apple.dock',
  #  value  => '5',
  #  notify => Exec['killall Dock'];
  #}
  #boxen::osx_defaults { 'Lower Left Hot Corner: Start Screen Saver modifier':
  #  user   => "${::boxen_user}",
  #  key    => 'wvous-bl-modifier',
  #  domain => 'com.apple.dock',
  #  value  => '0',
  #  notify => Exec['killall Dock'];
  #}
}
