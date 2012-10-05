class projects::enterprise-toolchain {
  require virtualbox

  $dir = "${boxen::config::srcdir}/enterprise-toolchain"

  repository { $dir:
    source => 'github/enterprise-toolchain'
  }

  ruby::local { $dir:
    version => '1.9.3-p194',
    require => Repository[$dir]
  }
}
