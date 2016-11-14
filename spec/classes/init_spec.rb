require 'spec_helper'
describe 'neo4j', :type => :class do
  context "on a Debian OS 7" do
    let :facts do
      {
	:architecture           => 'x86_64',
        :id                     => 'root',
        :ipaddress              => '127.0.0.1',
        :kernel                 => 'Linux',
        :lsbdistcodename        => 'squeeze',
        :osfamily               => 'Debian',
        :operatingsystem        => 'Debian',
        :operatingsystemrelease => '7.11',
      }
    end
    it { is_expected.to contain_class('neo4j') }
    it { is_expected.to compile.with_all_deps }
  end
  context "on a Debian OS 8" do
    let :facts do
      {
	:architecture           => 'x86_64',
        :id                     => 'root',
        :ipaddress              => '127.0.0.1',
        :kernel                 => 'Linux',
        :lsbdistcodename        => 'wheezy',
        :osfamily               => 'Debian',
        :operatingsystem        => 'Debian',
        :operatingsystemrelease => '8.5',
      }
    end
    it { is_expected.to contain_class('neo4j') }
    it { is_expected.to compile.with_all_deps }
  end
end
