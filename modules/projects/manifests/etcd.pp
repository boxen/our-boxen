class projects::etcd {
  exec{'retrieve etcd':
    command => "/opt/boxen/homebrew/bin/wget -q https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-darwin-amd64.zip -O /tmp/etcd-v0.4.6-darwin-amd64.zip",
    creates => "/tmp/etcd-v0.4.6-darwin-amd64.zip",
    require => Class['wget']
  }
  ->
  exec{'unzip etcd':
    command => "/usr/bin/unzip -o -d /tmp /tmp/etcd-v0.4.6-darwin-amd64.zip",
  }
  ->
  file{'/opt/boxen/homebrew/bin/etcd':
    source => '/tmp/etcd-v0.4.6-darwin-amd64/etcd',
  }
  ->
  file{'/opt/boxen/homebrew/bin/etcdctl':
    source => '/tmp/etcd-v0.4.6-darwin-amd64/etcdctl',
  }
}
