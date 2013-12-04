require 'spec_helper'

describe 'mysql::user' do
  let(:facts) do
    { :boxen_home => '/opt/boxen' }
  end
  let(:title) { 'name' }

  context "when ensure is present" do
    let(:params) do
      { :ensure => 'present' }
    end

    it { should include_class('mysql') }

    it "creates the user" do
      should contain_exec("create mysql user #{title}").
             with(
               :command => "mysql -uroot -p13306 --password=''\
        -e \"create user '#{title}'@'localhost' identified by '';\""
        )
    end
  end

  context "when ensure is absent" do
    let(:params) do
      { :ensure => 'absent' }
    end

    it { should include_class('mysql') }
    it { should_not contain_exec("create mysql user #{title}") }

    it "destroys the database" do
      should contain_exec("delete mysql user #{title}").
             with(
               :command => "mysql -uroot -p13306 --password='' -e 'drop user #{title}'"
             )
    end
  end
end
