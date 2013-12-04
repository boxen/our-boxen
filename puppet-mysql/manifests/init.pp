# Public: Install MySQL
#
# Examples
#
#   include mysql
class mysql {
  require mysql::config
  require homebrew

  file { [
    $mysql::config::configdir,
    $mysql::config::datadir,
    $mysql::config::logdir
  ]:
    ensure => directory,
  }

  file { $mysql::config::configfile:
    content => template('mysql/my.cnf.erb'),
    notify  => Service['dev.mysql'],
  }

  file { "${boxen::config::homebrewdir}/etc/my.cnf":
    ensure  => link,
    require => [
      Package['boxen/brews/mysql'],
      File[$mysql::config::configfile],
      Class['homebrew']
    ],
    target  => $mysql::config::configfile,
  }

  file { '/Library/LaunchDaemons/dev.mysql.plist':
    content => template('mysql/dev.mysql.plist.erb'),
    group   => 'wheel',
    notify  => Service['dev.mysql'],
    owner   => 'root'
  }

  homebrew::formula { 'mysql':
    before => Package['boxen/brews/mysql'],
  }

  package { 'boxen/brews/mysql':
    ensure => '5.5.20-boxen2',
    notify => Service['dev.mysql']
  }

  file { "${boxen::config::homebrewdir}/var/mysql":
    ensure  => absent,
    force   => true,
    recurse => true,
    require => Package['boxen/brews/mysql'],
  }

  exec { 'init-mysql-db':
    command  => "mysql_install_db \
      --verbose \
      --basedir=${boxen::config::homebrewdir} \
      --datadir=${mysql::config::datadir} \
      --tmpdir=/tmp",
    creates  => "${mysql::config::datadir}/mysql",
    provider => shell,
    require  => [
      Package['boxen/brews/mysql'],
      File["${boxen::config::homebrewdir}/var/mysql"]
    ],
    notify   => Service['dev.mysql']
  }

  service { 'dev.mysql':
    ensure  => running,
    notify  => Exec['wait-for-mysql'],
  }

  service { 'com.boxen.mysql': # replaced by dev.mysql
    before => Service['dev.mysql'],
    enable => false
  }

  file { "${boxen::config::envdir}/mysql.sh":
    content => template('mysql/env.sh.erb'),
    require => File[$boxen::config::envdir]
  }

  $nc = "/usr/bin/nc -z localhost ${mysql::config::port}"

  exec { 'wait-for-mysql':
    command     => "while ! ${nc}; do sleep 1; done",
    provider    => shell,
    timeout     => 30,
    refreshonly => true
  }

  exec { 'mysql-tzinfo-to-sql':
    command     => "mysql_tzinfo_to_sql /usr/share/zoneinfo | \
      mysql -u root mysql -P ${mysql::config::port} -S ${mysql::config::socket}",
    provider    => shell,
    creates     => "${mysql::config::datadir}/.tz_info_created",
    subscribe   => Exec['wait-for-mysql'],
    refreshonly => true
  }

  exec { 'grant root user privileges':
    command     => "mysql -u root --password='' \
      -P ${mysql::config::port} -S ${mysql::config::socket} \
      -e 'grant all privileges on *.* to \'root\'@\'localhost\''",
    unless      => "mysql -u root -P ${mysql::config::port} \
      -e \"select * from mysql.user where User = 'root' and Host = 'localhost'\" \
      --password='' | grep root",
    provider    => shell,
    subscribe   => Exec['wait-for-mysql'],
    refreshonly => true
  }
}
