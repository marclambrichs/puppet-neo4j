require 'spec_helper'
describe 'neo4j::service' do
  let(:facts) {
    {
      :path => '/usr/bin',
    }
  }
  let(:params) {
    {
      :group            => 'neo4j',
      :install_method   => 'package',
      :service_enable   => true,
      :service_ensure   => 'running',
      :service_name     => 'neo4j',
      :service_provider => 'systemd',
      :user             => 'neo4j',
    }
  }

  context 'service_enable set to true' do
    it { should contain_service('neo4j') }
    it { should_not contain_file('/etc/init.d/neo4j') }
    it { should_not contain_systemd__unit_file('neo4j.service') }
    it { should contain_service('neo4j').with({
        'name' => 'neo4j',
      })
    }
    
    context 'with install method set to archive' do
      let(:params) {
        {
          :group            => 'neo4j',
          :install_method   => 'archive',
          :service_enable   => true,
          :service_ensure   => 'running',
          :service_name     => 'neo4j',
          :service_provider => 'systemd',
          :user             => 'neo4j',
        }
      }

      context 'with service_provider set to systemd' do
        it { should_not contain_file('/etc/init.d/neo4j') }
        it { should contain_systemd__unit_file('neo4j.service') }
        it { should contain_service('neo4j').with({
            'provider' => 'systemd',
          })
        }
        context 'with service_name set to test' do
          let(:params) {
            {
              :group            => 'neo4j',
              :install_method   => 'archive',
              :service_enable   => true,
              :service_ensure   => 'running',
              :service_name     => 'test',
              :service_provider => 'systemd',
              :user             => 'neo4j',
            }
          }
          it { should_not contain_file('/etc/init.d/test') }
          it { should contain_systemd__unit_file('test.service') }
          it { should contain_service('neo4j').with({
              'name' => 'test',
            })
          }
        end
      end

      context 'with service_provider set to debian' do
        let(:params) {
          {
            :group            => 'neo4j',
            :install_method   => 'archive',
            :service_enable   => true,
            :service_ensure   => 'running',
            :service_name     => 'neo4j',
            :service_provider => 'debian',
            :user             => 'neo4j',
          }
        }
        it { should contain_file('/etc/init.d/neo4j') }
        it { should_not contain_systemd__unit_file('neo4j.service') }
        it { should contain_service('neo4j').with({
            'provider' => 'debian',
          })
        }

        context 'with user and group set to test' do
          let(:params) {
            {
              :group            => 'test',
              :install_method   => 'archive',
              :service_enable   => true,
              :service_ensure   => 'running',
              :service_name     => 'neo4j',
              :service_provider => 'debian',
              :user             => 'test',
            }
          }
          it { should contain_file('/etc/init.d/neo4j').with({
              'group' => 'test',
              'owner' => 'test',
            })
          }
        end

        context 'with service_name set to test' do
          let(:params) {
            {
              :group            => 'neo4j',
              :install_method   => 'archive',
              :service_enable   => true,
              :service_ensure   => 'running',
              :service_name     => 'test',
              :service_provider => 'debian',
              :user             => 'neo4j',
            }
          }
          it { should contain_file('/etc/init.d/test') }
          it { should_not contain_systemd__unit_file('test.service') }
          it { should contain_service('neo4j').with({
              'name' => 'test',
            })
          }
        end
      end

      context 'with service_provider set to init' do
        let(:params) {
          {
            :group            => 'neo4j',
            :install_method   => 'archive',
            :service_enable   => true,
            :service_ensure   => 'running',
            :service_name     => 'neo4j',
            :service_provider => 'init',
            :user             => 'neo4j',
          }
        }
        it { should contain_file('/etc/init.d/neo4j') }
        it { should_not contain_systemd__unit_file('neo4j.service') }
        it { should contain_service('neo4j').with({
            'provider' => 'init',
          })
        }

        context 'with user and group set to test' do
          let(:params) {
            {
              :group            => 'test',
              :install_method   => 'archive',
              :service_enable   => true,
              :service_ensure   => 'running',
              :service_name     => 'neo4j',
              :service_provider => 'init',
              :user             => 'test',
            }
          }
          it { should contain_file('/etc/init.d/neo4j').with({
              'group' => 'test',
              'owner' => 'test',
            })
          }
        end

        context 'with service_name set to test' do
          let(:params) {
            {
              :group            => 'neo4j',
              :install_method   => 'archive',
              :service_enable   => true,
              :service_ensure   => 'running',
              :service_name     => 'test',
              :service_provider => 'init',
              :user             => 'neo4j',
            }
          }
          it { should contain_file('/etc/init.d/test') }
          it { should_not contain_systemd__unit_file('test.service') }
          it { should contain_service('neo4j').with({
              'name' => 'test',
            })
          }
        end
      end

      context 'with service_provider set to redhat' do
        let(:params) {
          {
            :group            => 'neo4j',
            :install_method   => 'archive',
            :service_enable   => true,
            :service_ensure   => 'running',
            :service_name     => 'neo4j',
            :service_provider => 'redhat',
            :user             => 'neo4j',
          }
        }
        it { should contain_file('/etc/init.d/neo4j') }
        it { should_not contain_systemd__unit_file('neo4j.service') }
        it { should contain_service('neo4j').with({
            'provider' => 'redhat',
          })
        }

        context 'with user and group set to test' do
          let(:params) {
            {
              :group            => 'test',
              :install_method   => 'archive',
              :service_enable   => true,
              :service_ensure   => 'running',
              :service_name     => 'neo4j',
              :service_provider => 'redhat',
              :user             => 'test',
            }
          }
          it { should contain_file('/etc/init.d/neo4j').with({
              'group' => 'test',
              'owner' => 'test',
            })
          }
        end

        context 'with service_name set to test' do
          let(:params) {
            {
              :group            => 'neo4j',
              :install_method   => 'archive',
              :service_enable   => true,
              :service_ensure   => 'running',
              :service_name     => 'test',
              :service_provider => 'redhat',
              :user             => 'neo4j',
            }
          }
          it { should contain_file('/etc/init.d/test') }
          it { should_not contain_systemd__unit_file('test.service') }
          it { should contain_service('neo4j').with({
              'name' => 'test',
            })
          }
        end
      end

      context 'with service_provider set to magic' do
        let(:params) {
          {
            :group            => 'neo4j',
            :install_method   => 'archive',
            :service_enable   => true,
            :service_ensure   => 'running',
            :service_name     => 'neo4j',
            :service_provider => 'magic',
            :user             => 'neo4j',
          }
        }
        it { should raise_error(Puppet::PreformattedError,/Service provider magic not supported/)}
      end
    end

    context 'with service_ensure set to running' do
      it { should contain_service('neo4j').with({
          'ensure' => 'running',
        })
      }
    end

    context 'with service_ensure set to stopped' do
      let(:params) {
        {
          :group            => 'neo4j',
          :install_method   => 'package',
          :service_enable   => true,
          :service_ensure   => 'stopped',
          :service_name     => 'neo4j',
          :service_provider => 'systemd',
          :user             => 'neo4j',
        }
      }
      it { should contain_service('neo4j').with({
          'ensure' => 'stopped',
        })
      }
    end
  end

  context 'service_enable set to false' do
    let(:params) {
      {
        :group            => 'neo4j',
        :install_method   => 'package',
        :service_enable   => false,
        :service_ensure   => 'running',
        :service_name     => 'neo4j',
        :service_provider => 'systemd',
        :user             => 'neo4j',
      }
    }
    it { should_not contain_service('neo4j') }
  end
end
