class stagingsync {

  file { "drush_home":
    path => "/Users/${::boxen_user}/.drush",
    ensure => directory,
    require => Package['drush']
  }

  file { "stagingsync_home":
    path => "/Users/${::boxen_user}/.drush/staging_sync",
    ensure => directory,
    require => File['drush_home']
  }

  file { "/Users/${::boxen_user}/.drush/staging_sync/staging_sync.drush.inc":
    content  => template('stagingsync/staging_sync.drush.inc.erb'),
    require => File["stagingsync_home"]
  }

}
