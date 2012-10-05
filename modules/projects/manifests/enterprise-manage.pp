class projects::enterprise-manage {
  require gpgme

  $dir = "${boxen::config::srcdir}/enterprise-manage"

  repository { $dir:
    source => 'github/enterprise-manage'
  }

  ruby::local { $dir:
    version => '1.8.7-p358',
    require => Repository[$dir]
  }
}
