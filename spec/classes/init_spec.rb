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
      end
    end
  end
end
