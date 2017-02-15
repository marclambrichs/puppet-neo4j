require 'spec_helper'
describe 'neo4j' do
  on_os_under_test.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }
      context "install" do

        context 'with defaults for all parameters' do
          it { should_not contain_file('/usr/share/neo4j') }
          it { should_not contain_file('/usr/share') }
          it { should_not contain_archive('neo4j-community-3.1.1.tgz') }
          it { should contain_package('neo4j') }
        end

        context 'with release_deb set to testing', :if => (facts[:osfamily] == 'Debian') do
          let(:params) {
            {
              :manage_repo => true,
              :release_deb => 'testing',
            }
          }
          it { should contain_apt__source('neo4j').with(
            {
              'release' => 'testing/'
            })
          }
        end

        context 'with release_rpm set to testing', :if => (facts[:osfamily] == 'RedHat') do
          let(:params) {
            {
              :manage_repo => true,
              :release_rpm => 'testing',
            }
          }
          it { should contain_yumrepo('neo4j').with(
            {
              'baseurl' => 'http://yum.neo4j.org/testing'
            })
          }
        end

        context 'with install_method set to archive and version to 3.0.8' do
          let(:params) {
            {
                :install_method => 'archive',
                :install_prefix => '/usr/share',
                :version        => '3.0.8'
            }
          }
          it { should contain_file('/usr/share/neo4j-community-3.0.8') }
          it { should contain_file('/usr/share') }
          it { should contain_archive('neo4j-community-3.0.8.tgz') }
          it { should_not contain_package('neo4j') }
        end

        context 'with install_method set to archive and version to 3.1.1' do
          let(:params) {
            {
                :install_method => 'archive',
                :install_prefix => '/usr/share',
                :version        => '3.1.1'
            }
          }
          it { should contain_file('/usr/share/neo4j-community-3.1.1') }
          it { should contain_file('/usr/share') }
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
