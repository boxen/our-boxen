require 'spec_helper'

describe 'mysql' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'testuser',
    }
  end

  it do
    should include_class('mysql::config')
    should include_class('homebrew')

    should contain_homebrew__formula('mysql')

    should contain_package('boxen/brews/mysql')

    should contain_service('dev.mysql').with(:ensure => 'running')

    should contain_exec('init-mysql-db')

    should contain_exec('mysql-tzinfo-to-sql')
  end
end
