class projects::speakerdeck {
  require github::services::mongodb
  require ghostscript
  require imagemagick
  require github::services::redis
  require solr
  require github::packages::qt

  package { 'boxen/brews/xpdf': }

  $dir = "${boxen::config::srcdir}/speakerdeck"

  repository { $dir:
    source => 'github/speakerdeck'
  }

  ruby::local { $dir:
    version => '1.9.3-p194',
    require => Repository[$dir]
  }
}
