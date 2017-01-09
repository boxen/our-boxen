require 'spec_helper'

describe file('/opt/boxen/repo') do
  it { should be_directory }
end
