class people::awaxa::dotfiles {
  
  $dotfiles = "${boxen::config::srcdir}/dotfiles"

  repository { "$dotfiles":
    source => 'awaxa/dotfiles',
  }
  
  file { "/Users/$::luser/.vimrc":
    target  => "$dotfiles/home/.vimrc",
    require => Repository["$dotfiles"],
  }
  
  repository { "/Users/$::luser/.vim/bundle/vim-pathogen":
    source => 'tpope/vim-pathogen',
  }
  
  repository { "/Users/$::luser/.vim/bundle/vim-sensible":
    source => 'tpope/vim-sensible',
  }
  
}
