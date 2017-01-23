require 'spec_helper'
describe 'neo4j' do
  on_os_under_test.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }
      context "service" do

        context 'with defaults for all parameters' do
          it { should contain_service('neo4j') }
        end
      end
    end
  end
end
