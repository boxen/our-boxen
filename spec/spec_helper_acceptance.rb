require 'beaker-rspec'

UNSUPPORTED_PLATFORMS = [ 'windows', 'Solaris' ]

unless ENV['RS_PROVISION'] == 'no' or ENV['BEAKER_provision'] == 'no'
  hosts.each do |host|
    shell('sudo mkdir -p /opt/boxen', :acceptable_exit_codes => [0])
    shell('sudo chown vagrant:staff /opt/boxen', :acceptable_exit_codes => [0])
  end
end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation

  # Configure all nodes in nodeset
  c.before :suite do
    # Install module and dependencies
    puppet_module_install(
      :source => proj_root,
      :target_module_path => '/opt/boxen/',
      :module_name => 'repo',
    )
    git_origin = `git config --get remote.origin.url`
    hosts.each do |host|
      shell('cd /opt/boxen/repo/; git init;', :acceptable_exit_codes => [0])
      shell("cd /opt/boxen/repo/; git remote add origin #{git_origin}", :acceptable_exit_codes => [0])
      shell('cd /opt/boxen/repo/; git fetch -q origin; git reset --hard origin/master;', :acceptable_exit_codes => [0])
      shell('bash /opt/boxen/repo/script/setup-keychain.sh', :acceptable_exit_codes => [0])
      shell('bash /opt/boxen/repo/script/xcode-cli-tools.sh', :acceptable_exit_codes => [0])
      shell('sudo gem install rake -v 10.3.2 --force', :acceptable_exit_codes => [0])
      shell('cd /opt/boxen/repo/; script/bootstrap --deployment --local --without development:test --no-cache', :acceptable_exit_codes => [0])
      shell('cd /opt/boxen/repo/; /usr/bin/bundle install --binstubs bin --path .bundle --quiet', :acceptable_exit_codes => [0])
    end
  end
end
