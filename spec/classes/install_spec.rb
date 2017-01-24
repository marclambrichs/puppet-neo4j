require 'spec_helper'
describe 'neo4j' do
  on_os_under_test.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }
      context "install" do

        context 'with defaults for all parameters' do
          it { should_not contain_file('/usr/share/data') }
          it { should_not contain_file('/usr/share/neo4j') }
          it { should_not contain_file('/usr/share') }
          it { should_not contain_file('/var/log/neo4j') }
          it { should_not contain_archive('neo4j-community-3.1.1.tgz') }
          it { should contain_package('neo4j') }
        end

        context 'with install_method set to archive and version to 3.0.8' do
          let(:params) {
            {
                :install_method => 'archive',
                :version        => '3.0.8'
            }
          }
          it { should contain_file('/usr/share/data') }
          it { should contain_file('/usr/share/neo4j-community-3.0.8') }
          it { should contain_file('/usr/share') }
          it { should contain_file('/var/log/neo4j') }
          it { should contain_archive('neo4j-community-3.0.8.tgz') }
          it { should_not contain_package('neo4j') }
        end

        context 'with install_method set to archive and version to 3.1.1' do
          let(:params) {
            {
                :install_method => 'archive',
                :version        => '3.1.1'
            }
          }
          it { should contain_file('/usr/share/data') }
          it { should contain_file('/usr/share/neo4j-community-3.1.1') }
          it { should contain_file('/usr/share') }
          it { should contain_file('/var/log/neo4j') }
          it { should contain_archive('neo4j-community-3.1.1.tgz') }
          it { should_not contain_package('neo4j') }
        end

        context 'only install lsof when required' do
          context 'with install_method set to package' do
            it { should_not contain_package('lsof') }
          end
          context 'with install_method set to archive and source_release < 3.1.0' do
            let(:params) {
              {
                :install_method => 'archive',
                :version        => '3.0.8'
              }
            }
            it { should contain_package('lsof') }
          end
          context 'with install_method set to archive and source_release > 3.1.0' do
            let(:params) {
              {
                  :install_method => 'archive',
                  :version        => '3.1.1'
              }
            }
            it { should_not contain_package('lsof') }
          end
        end
      end
    end
  end
end
