class people::jmonette {
  include brewcask
  
  package { 'skype': provider => 'brewcask' }
  package { 'chrome': provider => 'brewcask' }
}
