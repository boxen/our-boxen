class people::awaxa::dotfiles {

  include people::awaxa::gitconfig

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${boxen::config::srcdir}/dotfiles"

  repository { "$dotfiles":
    source => 'awaxa/dotfiles';
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

  file {
    "$home/.tmux.conf":
      target  => "$dotfiles/home/.tmux.conf",
      require => Repository["$dotfiles"];
    "$home/.vimrc":
      target  => "$dotfiles/home/.vimrc",
      require => Repository["$dotfiles"];
    "$home/.profile":
      target  => "$dotfiles/home/.profile",
      require => Repository["$dotfiles"];
    "$home/.inputrc":
      target  => "$dotfiles/home/.inputrc",
      require => Repository["$dotfiles"];
    "$home/.bash_aliases":
      target  => "$dotfiles/home/.bash_aliases",
      require => Repository["$dotfiles"];
    "$home/.bashrc":
      target  => "$dotfiles/home/.bashrc",
      require => Repository["$dotfiles"];
    "$home/.ssh":
      ensure => directory;
    "$home/.ssh/config":
      target  => "$dotfiles/home/.ssh/config",
      require => [ File["$home/.ssh"], Repository["$dotfiles"] ];
  }

}
