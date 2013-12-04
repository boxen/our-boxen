# Public: Sets a MySQL Grant
#
# database - the name of the database to give access to
# username - the username of the user.
# readonly - If the user should be read-only. Defaults to false
# host - host to permit access from. Defaults to 'localhost'
#
# Examples
#
#   mysql::user { 'foo': }

define mysql::user::grant($database,
                          $username,
                          $ensure = present,
                          $host = 'localhost',
                          $readonly = false) {

  if $readonly {
    $grants = 'SELECT, LOCK TABLES, CREATE TEMPORARY TABLES'
  } else {
    $grants = 'ALL'
  }
  require mysql

  if $ensure == 'present' {
    exec { "granting ${username} access to ${database}":
      command => "mysql -uroot -p13306 --password='' \
        -e \"grant ${grants} on ${database}.* to '${username}'@'${host}'; \
        flush privileges;\"",
      require => Exec['wait-for-mysql'],
      unless  => "mysql -uroot -p13306 -e 'SHOW GRANTS FOR ${username}@${host};' \
        --password='' | grep -w '${database}' | grep -w '${grants}'"
    }
  } elsif $ensure == 'absent' {
    exec { "removing ${username} access to ${database}":
      command => "mysql -uroot -p13306 --password='' \
        -e \"REVOKE ALL PRIVILEGES on ${database}.* to '${username}'@'${host}'; \
        flush privileges;\"",
      require => Exec['wait-for-mysql'],
    }
  }
}
