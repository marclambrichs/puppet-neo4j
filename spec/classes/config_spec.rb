require 'spec_helper'
describe 'neo4j' do
  on_os_under_test.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }
      context "config" do

        context 'with defaults for all parameters' do
          it { should contain_file('neo4j-wrapper.conf') }
          it { should contain_concat__fragment('neo4j HA config') }
          it { should contain_concat__fragment('neo4j conf footer') }
          it { should contain_concat__fragment('neo4j config general') }
          it { should contain_concat__fragment('neo4j logging config') }
          it { should contain_concat__fragment('neo4j miscellaneous config') }
          it { should contain_concat__fragment('neo4j network connector config') }
          it { should contain_concat('/usr/share/neo4j/conf/neo4j.conf') }
        end
      end
    end
  end
end
