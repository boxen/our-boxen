require 'spec_helper'

describe 'mysql::user::grant' do
  let(:facts) do
    { :boxen_home => '/opt/boxen' }
  end
  let(:title) { 'name' }
  let(:user) { 'user' }
  let(:database) { 'database' }

  context "when ensure is present" do
    let(:params) do
      { :username => user,
        :database => database }
    end

    it { should include_class('mysql') }

    it "creates the grant" do
      should contain_exec("granting #{user} access to #{database}").
             with(
               :command => "mysql -uroot -p13306 --password='' \
        -e \"grant ALL on #{database}.* to '#{user}'@'localhost'; \
        flush privileges;\""
        )
    end
  end


  context "when ensure is absent" do
    let(:params) do
      { :ensure   => 'absent',
        :username => user,
        :database => database }
    end

    it { should include_class('mysql') }
    it { should_not contain_exec("granting #{user} access to #{database}") }

    it "revokes the users privs" do
      should contain_exec("removing #{user} access to #{database}").
             with(
               :command => "mysql -uroot -p13306 --password='' \
        -e \"REVOKE ALL PRIVILEGES on #{database}.* to '#{user}'@'localhost'; \
        flush privileges;\""
             )
    end
  end
end
