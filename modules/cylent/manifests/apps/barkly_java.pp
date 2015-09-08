class cylent::apps::barkly_java {
  notify { 'class cylent::apps::barkly_java declared': }

  package { 'java':
    provider => 'brewcask'
  }
  ->
  package { 'maven':
  }
}
