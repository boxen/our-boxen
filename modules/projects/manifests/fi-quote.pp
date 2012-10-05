class projects::fi-quote {
  require wkhtmltopdf

  $dir = "${boxen::config::srcdir}/fi-quote"

  repository { $dir:
    source => 'github/fi-quote'
  }
}
