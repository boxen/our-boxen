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

}
