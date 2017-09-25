require 'spec_helper'

# describe 'script/nuke' do
#   describe command('/opt/boxen/repo/script/nuke --help') do
#     its(:stdout) { should include '--all' }
#     its(:stdout) { should include '--force' }
#     its(:stdout) { should include '--opt' }
#     its(:stdout) { should include '--services' }
#     its(:stdout) { should include '--receipts' }
#     its(:stdout) { should include '--gitconfig' }
#     its(:stdout) { should include '--homebrew-config' }
#   end

#   describe '--homebrew-config' do
#     it "cleans out $HOMEBREW_ROOT" do
#       creation_command_exit_status = command('touch $HOMEBREW_ROOT/etc/boxen/service.config').exit_status
#       cleanup_command_exit_status  = command('/opt/boxen/repo/script/nuke --force --homebrew-config').exit_status
#       file_count_stdout  = command('find $HOMEBREW_ROOT/etc/boxen -type f | wc -l').stdout.strip

#       expect(creation_command_exit_status).to eq(0)
#       expect(cleanup_command_exit_status).to eq(0)
#       expect(file_count_stdout).to eq("0")
#     end
#   end
# end
