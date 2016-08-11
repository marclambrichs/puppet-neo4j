require 'spec_helper'
describe 'neo4j', :type => :class do
    let :facts do
      {
        :ipaddress => '127.0.0.1',
        :kernel    => 'Linux',
      }
    end
    it { is_expected.to compile.with_all_deps }
    it { is_expected.to contain_class('neo4j') }
end