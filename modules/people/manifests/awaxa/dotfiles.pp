class people::awaxa::dotfiles {

  include people::awaxa::gitconfig

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${boxen::config::srcdir}/dotfiles"

  repository { "$dotfiles":
    source => 'awaxa/dotfiles',
  }

  vim::bundle { [
    'tpope/vim-sensible',
    'godlygeek/tabular',
    'rodjek/vim-puppet',
    'scrooloose/syntastic',
    'scrooloose/nerdtree',
    'Shougo/neocomplcache.vim',
    'bling/vim-airline',
    'kien/ctrlp.vim',
  ]: }

  file { "$home/.tmux.conf":
    ensure  => link,
    target  => "$dotfiles/home/.tmux.conf",
    require => Repository["$dotfiles"],
  }

  file { "$home/.vimrc":
    ensure  => link,
    target  => "$dotfiles/home/.vimrc",
    require => Repository["$dotfiles"],
  }

  file { "$home/.profile":
    ensure  => link,
    target  => "$dotfiles/home/.profile",
    require => Repository["$dotfiles"],
  }

  file { "$home/.inputrc":
    ensure  => link,
    target  => "$dotfiles/home/.inputrc",
    require => Repository["$dotfiles"],
  }

  file { "$home/.bash_aliases":
    ensure  => link,
    target  => "$dotfiles/home/.bash_aliases",
    require => Repository["$dotfiles"],
  }

  file { "$home/.bashrc":
    ensure  => link,
    target  => "$dotfiles/home/.bashrc",
    require => Repository["$dotfiles"],
  }

  file { "$home/.ssh":
    ensure => directory,
  }

  file { "$home/.ssh/config":
    ensure  => link,
    target  => "$dotfiles/home/.ssh/config",
    require => [ File["$home/.ssh"], Repository["$dotfiles"] ],
  }

}
