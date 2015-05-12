class projects::simplicitree {

  boxen::project { 'simplicitree':
    ruby   => '2.1.2',
    postgresql  => true,
    nginx  => true,
    source => 'lattapartners/simplicitree'
  }
}