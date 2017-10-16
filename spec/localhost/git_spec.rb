require 'spec_helper'

describe package('git') do
  it { should be_installed }
end
