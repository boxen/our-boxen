class cylent::vagrant::vagrant_vmware {
  notify { 'class cylent::vagrant::vagrant_vmware declared':}

  $license_file = "${cylent_repo_dir}/licenses/vagrant-vmware-fusion/${github_login}/license.lic"
  $install_cmd = "vagrant plugin install vagrant-vmware-fusion"
  $install_license_cmd = "vagrant plugin license vagrant-vmware-fusion ${license_file}"

  exec { $install_cmd:
    command   => $install_cmd,
    unless    => "vagrant plugin list | grep vagrant-vmware-fusion",
    require   => Class['vagrant'],
  }

  exec { $install_license_cmd:
    command     => $install_license_cmd,
    onlyif      => "test -e $license_file",
    refreshonly => true,
    require     => Repository["${cylent_repo_dir}/licenses"],
    subscribe   => Exec[$install_cmd],
  }
}
