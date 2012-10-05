class projects::enterprise-crypto {
  require gpgme

  $dir = "${boxen::config::srcdir}/enterprise-crypto"

  repository { $dir:
    source => 'github/enterprise-crypto'
  }

  ruby::local { $dir:
    version => '1.8.7-p358',
    require => Repository[$dir]
  }

}
