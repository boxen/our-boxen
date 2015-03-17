class projects::etcd {
  exec{'retrieve etcd':
    command => "/opt/boxen/homebrew/bin/wget -q https://github.com/coreos/etcd/releases/download/v2.0.5/etcd-v2.0.5-darwin-amd64.zip -O /tmp/etcd-v2.0.5-darwin-amd64.zip",
    creates => "/tmp/etcd-v2.0.5-darwin-amd64.zip",
    require => Class['wget']
  }
  ->
  exec{'unzip etcd':
    command => "/usr/bin/unzip -o -d /tmp /tmp/etcd-v2.0.5-darwin-amd64.zip",
  }
  ->
  file{'/opt/boxen/homebrew/bin/etcd':
    source => '/tmp/etcd-v2.0.5-darwin-amd64/etcd',
  }
  ->
  file{'/opt/boxen/homebrew/bin/etcdctl':
    source => '/tmp/etcd-v2.0.5-darwin-amd64/etcdctl',
  }
  file{"${boxen::config::home}/data/go":
    ensure => directory
  }
  ->
  exec{'foreman':
    environment => ["GOPATH=/opt/boxen/data/go"],
    command => "/opt/boxen/homebrew/bin/go get github.com/mattn/goreman",
    require => Package['go']
  }
}
