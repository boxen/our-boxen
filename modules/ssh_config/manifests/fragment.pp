# Add a fragment of an ssh config file
define ssh_config::fragment (
  $content = undef,
  $source  = undef
  ) {
    include ssh_config
    concat::fragment {"ssh_config_${title}":
      target  => $::ssh_config::path,
      source  => $source,
      content => $content,
    }
}
