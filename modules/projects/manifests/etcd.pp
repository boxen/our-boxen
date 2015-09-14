
class projects::etcd {
  include homebrew::config

  exec{'retrieve etcd':
    command => "${homebrew::config::installdir}/bin/wget -q https://github.com/coreos/etcd/releases/download/v2.1.3/etcd-v2.1.3-darwin-amd64.zip -O /tmp/etcd-v2.1.3-darwin-amd64.zip",
    creates => "/tmp/etcd-v2.1.3-darwin-amd64.zip",
    require => Class['wget']
  }
  ->
  exec{'unzip etcd':
    command => "/usr/bin/unzip -o -d /tmp /tmp/etcd-v2.1.3-darwin-amd64.zip",
  }
  ->
  file{"${homebrew::config::installdir}/bin/etcd":
    source => '/tmp/etcd-v2.1.3-darwin-amd64/etcd',
  }
  ->
  file{"${homebrew::config::installdir}/bin/etcdctl":
    source => '/tmp/etcd-v2.1.3-darwin-amd64/etcdctl',
  }
  file{"${boxen::config::home}/data/go":
    ensure => directory
  }
  ->
  exec{'foreman':
    environment => ["GOPATH=/opt/boxen/data/go"],
    command => "${homebrew::config::installdir}/bin/go get github.com/mattn/goreman",
    require => Package['go']
  }
}
