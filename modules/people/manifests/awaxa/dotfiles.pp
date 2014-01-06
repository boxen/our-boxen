class people::awaxa::dotfiles {

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${boxen::config::srcdir}/dotfiles"

  repository {
    "$dotfiles":
      source => 'awaxa/dotfiles';
    "$home/.vim/bundle/vim-pathogen":
      source => 'tpope/vim-pathogen';
    "$home/.vim/bundle/vim-sensible":
      source => 'tpope/vim-sensible';
  }

  file {
    "/$home/.tmux.conf":
      target  => "$dotfiles/home/.tmux.conf",
      require => Repository["$dotfiles"];
    "/$home/.vimrc":
      target  => "$dotfiles/home/.vimrc",
      require => Repository["$dotfiles"];
  }

}
