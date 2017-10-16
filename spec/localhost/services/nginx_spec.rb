require 'spec_helper'

describe 'nginx' do
  describe file('/usr/local/etc/boxen/nginx') do
    it { should be_directory }
  end

  describe file('/usr/local/etc/boxen/nginx/sites') do
    it { should be_directory }
  end

  describe file('/usr/local/etc/boxen/nginx/public') do
    it { should be_directory }
  end

  describe file('/usr/local/etc/boxen/nginx/nginx.conf') do
    it { should be_file }
  end

  describe file('/opt/boxen/log/nginx') do
    it { should be_directory }
  end

  describe file('/opt/boxen/data/nginx') do
    it { should be_directory }
  end
end
