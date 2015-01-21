require 'spec_helper_acceptance'

describe 'boxen' do

  context 'sanity check' do
    it 'runs with no errors' do
      shell("cd /opt/boxen/repo && BOXEN_NO_PULL=true ./script/boxen --no-fde --debug --token=#{ENV['GITHUB_API_TOKEN']}", :acceptable_exit_codes => [0,2]) do | cmd |
        expect(cmd.stdout).to_not match(/has failures: true/)
      end
    end
  end
end