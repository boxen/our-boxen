class people::jsyeo {
  include quicksilver
  class { 'thunderbird':
    version => '31.1.1'
  }
}
