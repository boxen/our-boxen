class people::jmonette {

  package {'emacs': provider => brewcask'}
  package {'iterm2::stable': provider => 'brewcask'}
  package {'chrome': provider => 'brewcask'}
  package {'skype': 'provider => 'brewcask'}

  include brewcask
  include emacs
  include iterm2::stable
  include chrome
  include skype
}
