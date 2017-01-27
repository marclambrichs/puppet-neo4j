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
          it { should contain_concat('/etc/neo4j/neo4j.conf') }
        end

        context 'with install_method set to archive and version to 3.0.8' do
          let(:params) {
            {
                :install_method => 'archive',
                :version        => '3.0.8'
            }
          }
          it { should contain_concat('/etc/neo4j-community-3.0.8/neo4j.conf') }
        end

        context 'with install_method set to archive and version to 3.1.1' do
          let(:params) {
            {
                :install_method => 'archive',
                :version        => '3.1.1'
            }
          }
          it { should contain_concat('/etc/neo4j-community-3.1.1/neo4j.conf') }
        end
      end
    end
  end
end
