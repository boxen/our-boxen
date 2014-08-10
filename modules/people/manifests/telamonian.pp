class people::telamonian {
  include homebrew
  ensure_resource('homebrew::tap',
                  'homebrew/science', { 'ensure' => 'present' })
  package {'hdf5':
            require => Homebrew::Tap['homebrew/science']
          }
  package {'mpich2':
            install_options => ['--disable-fortran'],
          }
  package {['protobuf',
            'cmake'
           ]:
  }
}
