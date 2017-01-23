require 'spec_helper'

describe 'neo4j', :type => :class do
  on_os_under_test.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      context 'with defaults for all parameters' do
        it { is_expected.to compile.with_all_deps }
        it { should contain_class('neo4j') }
      end
    end
  end
end
