class oddhill::implementation::ruby_gems {
  class { 'ruby::global':
    version => '2.1.1'
  }

  ruby_gem { 'sass':
    gem     => 'sass',
    version => '3.4.14',
    ruby_version    => '2.1.1'
  }

  ruby_gem { 'compass':
    gem     => 'compass',
    ruby_version    => '2.1.1'
  }

  ruby_gem { 'scss-lint':
    gem     => 'scss-lint',
    ruby_version    => '2.1.1'
  }

  ruby_gem { 'sass-globbing':
    gem     => 'sass-globbing',
    version => '1.1.0',
    ruby_version    => '2.1.1'
  }
}
