# Installs solr via Homebrew.
#
# Usage:
#
#     include solr
class solr {
  include homebrew
  include java
  include solr::config

  homebrew::formula { 'solr': }
  ->
  package { 'boxen/brews/solr':
    ensure  => '4.4.0-boxen1',
    require => Class['java']
  }

  file { "$solr::config::configdir/elevate.xml":
    content => template('solr/4.x/elevate.xml.erb'),
    owner   => root,
    group   => wheel
  }

  file { "$solr::config::configdir/mapping-ISOLatin1Accent.txt":
    content => template('solr/4.x/mapping-ISOLatin1Accent.txt.erb'),
    owner   => root,
    group   => wheel
  }

  file { "$solr::config::configdir/protwords.txt":
    content => template('solr/4.x/protwords.txt.erb'),
    owner   => root,
    group   => wheel
  }

  file { "$solr::config::configdir/schema_extra_fields.xml":
    content => template('solr/4.x/schema_extra_fields.xml.erb'),
    owner   => root,
    group   => wheel
  }

  file { "$solr::config::configdir/schema_extra_types.xml":
    content => template('solr/4.x/schema_extra_types.xml.erb'),
    owner   => root,
    group   => wheel
  }

  file { "$solr::config::configdir/schema.xml":
    content => template('solr/4.x/schema.xml.erb'),
    owner   => root,
    group   => wheel
  }

  file { "$solr::config::configdir/solrconfig_extra.xml":
    content => template('solr/4.x/solrconfig_extra.xml.erb'),
    owner   => root,
    group   => wheel
  }

  file { "$solr::config::configdir/solrconfig.xml":
    content => template('solr/4.x/solrconfig.xml.erb'),
    owner   => root,
    group   => wheel
  }

  file { "$solr::config::configdir/solrcore.properties":
    content => template('solr/4.x/solrcore.properties.erb'),
    owner   => root,
    group   => wheel
  }

  file { "$solr::config::configdir/stopwords.txt":
    content => template('solr/4.x/stopwords.txt.erb'),
    owner   => root,
    group   => wheel
  }

  file { "$solr::config::configdir/synonyms.txt":
    content => template('solr/4.x/synonyms.txt.erb'),
    owner   => root,
    group   => wheel
  }
}
