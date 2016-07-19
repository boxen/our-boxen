class people::farfromguam {
  `
  include osx::dock::2d
  include osx::dock::autohide
  include osx::dock::clear_dock
  include osx::dock::disable
  include osx::dock::disable_dashboard
  include osx::dock::dim_hidden_apps
  include osx::dock::hide_indicator_lights

  include osx::finder::show_all_filename_extensions
  include osx::finder::no_file_extension_warnings


  include steam
  include appcleaner
  include flux
  include caffeine


  # https://github.com/boxen/puppet-karabiner
  include karabiner
  include karabiner::login_item

}
