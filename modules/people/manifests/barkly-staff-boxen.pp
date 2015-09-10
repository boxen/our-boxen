class people::default {
  include cylent::dev_environment

  ###### Environment Settings ##########
  include osx::finder::show_all_on_desktop
  include osx::finder::show_hidden_files

  include cylent::osx::dock::minimize_to_application

}
