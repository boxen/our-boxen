require 'facter'

Facter.add(:cylent_repo_dir) { setcode "echo $HOME/cylent" }
