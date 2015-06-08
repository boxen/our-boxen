class people::jmonette {
  include brewcask
  
  package { 'skype': provider => 'brewcask' }
  packave { 'chrome': provider => 'brewcask' }
}
