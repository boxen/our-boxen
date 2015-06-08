class people::jmonette {
  include emacs   # requires emacs module in Puppetfile
  include iterm2:stable
  include brewcask
  include chrome
  include skype

  package {
    'skype': provier => 'brewcask'
  }
}
