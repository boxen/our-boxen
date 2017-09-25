require 'spec_helper'

%w(ack findutils gnu-tar).each do |package_name|
  describe package(package_name) do
    it { should be_installed }
  end
end
