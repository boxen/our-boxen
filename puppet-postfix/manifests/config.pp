# Config class for Postfix.

class postfix::config {

  $mainfile = '/etc/postfix/main.cf'

  # Send mail via Mandrill. See the documentation at
  # http://help.mandrill.com/entries/23060367-Can-I-configure-Postfix-to-send-through-Mandrill-
  # for further information.
  $smtp_sasl_auth_enable = 'yes'
  $smtp_sasl_password_maps = 'hash:/etc/postfix/sasl_passwd'
  $smtp_sasl_security_options = 'noanonymous'
  $smtp_use_tls = 'yes' 
  $relayhost = '[smtp.mandrillapp.com]'

}
