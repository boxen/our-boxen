require 'spec_helper'

describe file('/opt/boxen/repo') do
  it { should be_directory }
end

describe 'Boxen managed configuration files' do
  describe file('/usr/local/etc/boxen') do
    it { should be_directory }
  end
end
