require 'spec_helper'

describe 'solr' do
  let(:facts) { default_test_facts }

  it do
    should include_class('homebrew')
    should include_class('java')

    should contain_homebrew__formula('solr').with_before('Package[boxen/brews/solr]')

    should contain_package('boxen/brews/solr').with({
      :ensure  => '4.4.0-boxen1',
      :require => 'Class[Java]'
    })
  end
end
