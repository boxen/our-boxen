require 'spec_helper'

describe package('hub') do
  it { should be_installed }
end
