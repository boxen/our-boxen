class moexmen::environment {
  class { 'osx::global::natural_mouse_scrolling':
    enabled => false
  }

  class { 'osx::dock::hot_corners':
    bottom_left => "Start Screen Saver",
    top_right => "Mission Control",
    bottom_right => "Desktop"
  }
  
  include osx::dock::hot_corners

  include osx::global::natural_mouse_scrolling
  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::tap_to_click

  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::finder::enable_quicklook_text_selection

  include osx::disable_app_quarantine
  include osx::no_network_dsstores
  include osx::software_update

  include chrome
  include firefox
  include mysql
  include heroku
  include virtualbox
  include java
  include vlc
  include spotify
  include wget
  include rubymine
  include postgresql
  include zsh
  include dropbox
  include iterm2::dev
  include iterm2::colors::zenburn
}
