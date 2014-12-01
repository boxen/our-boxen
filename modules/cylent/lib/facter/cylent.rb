require 'facter'

facts = {}

facts["home"] = "#{ENV['HOME']}"
facts["cylent_repo_dir"] = "#{ENV['HOME']}/cylent"
facts["cylent_dotfiles"] = "#{ENV['HOME']}/cylent/dotfiles"
facts["cylent_env"] = "#{ENV['HOME']}/.env"

facts.each { |k, v| Facter.add(k) { setcode { v } } }
