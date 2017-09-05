require 'spec_helper'

describe 'script/nuke' do
  describe command('/opt/boxen/repo/script/nuke --help') do
    its(:content) { should include '--all' }
    its(:content) { should include '--force' }
    its(:content) { should include '--opt' }
    its(:content) { should include '--services' }
    its(:content) { should include '--receipts' }
    its(:content) { should include '--gitconfig' }
    its(:content) { should include '--homebrew-config' }
  end

  describe '--homebrew-config' do
    it 'cleans out /etc/boxen' do
      creation_command_exit_status = command('touch /etc/boxen/service.config').exit_status
      cleanup_command_exit_status  = command('/opt/boxen/repo/script/nuke --force --homebrew-config').exit_status
      file_count_stdout  = command('find /etc/boxen -type f | wc -l').stdout.strip

      creation_command_exit_status.should eq(0)
      cleanup_command_exit_status.should eq(0)
      file_count_stdout.should eq("0")
    end
  end
end
