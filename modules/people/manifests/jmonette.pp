class people::jmonette {
  include brewcask
  
  package { 'skype': provider => 'brewcask' }
  package { 'google-chrome': provider => 'brewcask' }
}
