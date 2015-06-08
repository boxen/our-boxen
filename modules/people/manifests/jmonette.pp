class people::jmonette {
  include brewcask
  include emacs
  include iterm2::stable
  include chrome
  include skype

  package { 'skype': provider => 'brewcask' }
  package { 'emacs': provider => 'brewcask' }
  package { 'iterm2': provider => 'brewcask' }
  package { 'chrome': provider => 'brewcask' }
}
