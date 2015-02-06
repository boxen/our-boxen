class projects::portal {
  include virtualbox
  include docker
  include redis
  include homebrew
  include stdlib
  include sysctl
  include postgresql
}
