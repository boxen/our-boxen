class people::farfromguam::env_settings {

  # Recovery Message on Lock Screen
  osx::recovery_message { '@farfromguam - If this Mac is found, please call +1.901.604.5976': }

  # Global Settings
  include osx::global::disable_autocorrect
  include osx::global::disable_key_press_and_hold
  include osx::global::disable_remote_control_ir_receiver
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click

  # Fonts
  include fonts::adobe

  # Finder Settings
  include osx::finder::empty_trash_securely
  include osx::finder::no_file_extension_warnings
  include osx::finder::show_all_filename_extensions
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library

  # Dock Settings
  include osx::dock::autohide
  include osx::dock::2d
  include osx::dock::clear_dock
  include osx::dock::disable_dashboard
  include osx::dock::dim_hidden_apps
  include osx::dock::hide_indicator_lights
  class { 'osx::dock::icon_size':
    size => 36,
  }

  # Misc Settings
  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update

  include osx::safari::enable_developer_mode

  class { 'osx::sound::interface_sound_effects':
    enable => false,
  }


  # https://github.com/boxen/puppet-karabiner
  include karabiner
  include karabiner::login_item

  # apps
  include appcleaner
  include caffeine
  include flux
  include steam
}
