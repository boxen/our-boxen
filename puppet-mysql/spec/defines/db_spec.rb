require 'spec_helper'

describe 'mysql::db' do
  let(:facts) do
    { :boxen_home => '/opt/boxen' }
  end
  let(:title) { 'name' }

  context "when ensure is present" do
    let(:params) do
      { :ensure => 'present' }
    end

    it { should include_class('mysql') }

    it "creates the database" do
      should contain_exec("create mysql db #{title}").
             with(
               :command => "mysqladmin -uroot -p13306 create #{title} --password=''",
               :creates => "/opt/boxen/data/mysql/#{title}"
             )
    end
  end

  context "when ensure is absent" do
    let(:params) do
      { :ensure => 'absent' }
    end

    it { should include_class('mysql') }
    it { should_not contain_exec("create mysql db #{title}") }

    it "destroys the database" do
      should contain_exec("delete mysql db #{title}").
             with(
               :command => "mysqladmin -uroot -p13306 drop #{title} --password=''"
             )
    end
  end
end
