class cylent::dev_environment {
  notify { 'class cylent::dev_envronment declared': }

  include cylent::apps::default_apps
}
