require 'spec_helper'

describe 'neo4j', :type => :class do
  on_os_under_test.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      context 'with defaults for all parameters' do
        it { should contain_file('/usr/share/data') }
        it { should contain_file('/usr/share/neo4j') }
        it { should contain_file('/usr/share') }
        it { should contain_file('/var/log/neo4j') }
        it { should contain_package('neo4j') }
      end
    end
  end
end
