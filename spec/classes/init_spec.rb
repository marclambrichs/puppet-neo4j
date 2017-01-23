require 'spec_helper'

describe 'neo4j', :type => :class do
  on_os_under_test.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      context 'with defaults for all parameters' do
        it { is_expected.to compile.with_all_deps }
        it { should contain_class('neo4j') }
        it { should contain_anchor('neo4j::begin').that_comes_before('Class[neo4j::Install]') }
        it { should contain_class('neo4j::install').that_comes_before('Class[neo4j::Config]') }
        it { should contain_class('neo4j::config').that_notifies('Class[neo4j::Service]') }
        it { should contain_class('neo4j::service').that_comes_before('Anchor[neo4j::end]') }
        it { should contain_anchor('neo4j::end') }
        it { should contain_file('neo4j-wrapper.conf') }
        it { should contain_concat__fragment('neo4j HA config') }
        it { should contain_concat__fragment('neo4j conf footer') }
        it { should contain_concat__fragment('neo4j config general') }
        it { should contain_concat__fragment('neo4j logging config') }
        it { should contain_concat__fragment('neo4j miscellaneous config') }
        it { should contain_concat__fragment('neo4j network connector config') }
        it { should contain_concat('/usr/share/neo4j/conf/neo4j.conf') }
        it { should contain_file('/usr/share/data') }
        it { should contain_file('/usr/share/neo4j') }
        it { should contain_file('/usr/share') }
        it { should contain_file('/var/log/neo4j') }
        it { should contain_group('neo4j') }
        it { should contain_package('neo4j') }
        it { should contain_service('neo4j') }
        it { should contain_user('neo4j') }
      end
    end
  end
end
