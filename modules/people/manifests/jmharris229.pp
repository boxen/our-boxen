class people::jmharris229 {

  include iterm2::stable
  include spotify

  include sublime_text_2
  sublime_text_2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

}
