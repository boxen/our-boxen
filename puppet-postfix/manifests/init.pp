# Class for Postfix.

class postfix {

  include postfix::config
  include postfix::mandrill

  file { $postfix::config::mainfile:
    content => template('postfix/main.cf.erb'),
    group   => 'wheel',
    owner   => 'root',
    notify  => Exec['restart postfix'],
  }
  
  file { $postfix::mandrill::saslfile:
    content => template('postfix/sasl_passwd.erb'),
    group   => 'wheel',
    owner   => 'root',
    mode    => 600,
    notify  => Exec['postmap sasl_passwd'],
  }
  
  exec { 'restart postfix' :
    command => 'postfix stop && postfix start',
    cwd => '/usr/sbin',
    user => 'root',
    refreshonly => true,
  }
  
  exec { 'postmap sasl_passwd' :
    command => 'postmap /etc/postfix/sasl_passwd',
    cwd => '/usr/sbin',
    user => 'root',
    refreshonly => true,
    notify  => Exec['restart postfix'],
  }

}
