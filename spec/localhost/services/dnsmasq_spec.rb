require 'spec_helper'

describe 'dnsmasq' do
  describe file('/usr/local/etc/boxen/dnsmasq') do
    it { should be_directory }
  end

  describe file('/usr/local/etc/boxen/dnsmasq/dnsmasq.conf') do
    it { should be_file }
  end

  describe file('/opt/boxen/data/dnsmasq') do
    it { should be_directory }
  end

  describe file('/opt/boxen/log/dnsmasq') do
    it { should be_directory }
  end
end
