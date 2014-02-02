class people::awaxa {

  $globalruby = '2.0.0'

  class { 'ruby::global':
    version => "$globalruby"
  }

  include people::awaxa::applications
  include people::awaxa::dotfiles
  include people::awaxa::gitconfig
  include people::awaxa::preferences
  include people::awaxa::puppetlabs
}
