require 'spec_helper'
describe 'neo4j::service' do
  let(:facts) do
    {
      path: '/usr/bin'
    }
  end
  let(:params) do
    {
      config_dir: '/etc/neo4j',
      data_prefix: '/var/lib/neo4j',
      group: 'neo4j',
      install_method: 'package',
      neo4j_home: '/usr/neo4j',
      service_enable: true,
      service_ensure: 'running',
      service_name: 'neo4j',
      service_provider: 'systemd',
      service_shutdown_timeout: '120',
      service_ulimit: '60000',
      user: 'neo4j'
    }
  end

  context 'with service_enable set to true' do
    it { is_expected.to contain_service('neo4j') }
    it { is_expected.not_to contain_file('/etc/init.d/neo4j') }
    it { is_expected.not_to contain_systemd__unit_file('neo4j.service') }
    it { is_expected.to contain_service('neo4j').with('name' => 'neo4j') }

    context 'with install_method set to archive' do
      let(:params) do
        {
          config_dir: '/etc/neo4j',
          data_prefix: '/var/lib/neo4j',
          group: 'neo4j',
          install_method: 'archive',
          neo4j_home: '/usr/neo4j',
          service_enable: true,
          service_ensure: 'running',
          service_name: 'neo4j',
          service_provider: 'systemd',
          service_shutdown_timeout: '120',
          service_ulimit: '60000',
          user: 'neo4j'
        }
      end

      context 'with service_provider set to systemd' do
        it { is_expected.not_to contain_file('/etc/init.d/neo4j') }
        it { is_expected.to contain_systemd__unit_file('neo4j.service') }
        it do
          is_expected.to contain_service('neo4j').with('provider' => 'systemd')
        end
        context 'with service_name set to test' do
          let(:params) do
            {
              config_dir: '/etc/neo4j',
              data_prefix: '/var/lib/neo4j',
              group: 'neo4j',
              install_method: 'archive',
              neo4j_home: '/usr/neo4j',
              service_enable: true,
              service_ensure: 'running',
              service_name: 'test',
              service_provider: 'systemd',
              service_shutdown_timeout: '120',
              service_ulimit: '60000',
              user: 'neo4j'
            }
          end
          it { is_expected.not_to contain_file('/etc/init.d/test') }
          it { is_expected.to contain_systemd__unit_file('test.service') }
          it do
            is_expected.to contain_service('neo4j').with('name' => 'test')
          end
        end
      end

      context 'with service_provider set to debian' do
        let(:params) do
          {
            config_dir: '/etc/neo4j',
            data_prefix: '/var/lib/neo4j',
            group: 'neo4j',
            install_method: 'archive',
            neo4j_home: '/usr/neo4j',
            service_enable: true,
            service_ensure: 'running',
            service_name: 'neo4j',
            service_provider: 'debian',
            service_shutdown_timeout: '120',
            service_ulimit: '60000',
            user: 'neo4j'
          }
        end
        it { is_expected.to contain_file('/etc/init.d/neo4j') }
        it { is_expected.not_to contain_systemd__unit_file('neo4j.service') }
        it do
          is_expected.to contain_service('neo4j').with('provider' => 'debian')
        end

        context 'with user and group set to test' do
          let(:params) do
            {
              config_dir: '/etc/neo4j',
              data_prefix: '/var/lib/neo4j',
              group: 'test',
              install_method: 'archive',
              neo4j_home: '/usr/neo4j',
              service_enable: true,
              service_ensure: 'running',
              service_name: 'neo4j',
              service_provider: 'debian',
              service_shutdown_timeout: '120',
              service_ulimit: '60000',
              user: 'test'
            }
          end
          it do
            is_expected.to contain_file('/etc/init.d/neo4j').with('group' => 'test',
                                                                  'owner' => 'test')
          end
        end

        context 'with service_name set to test' do
          let(:params) do
            {
              config_dir: '/etc/neo4j',
              data_prefix: '/var/lib/neo4j',
              group: 'neo4j',
              install_method: 'archive',
              neo4j_home: '/usr/neo4j',
              service_enable: true,
              service_ensure: 'running',
              service_name: 'test',
              service_provider: 'debian',
              service_shutdown_timeout: '120',
              service_ulimit: '60000',
              user: 'neo4j'
            }
          end
          it { is_expected.to contain_file('/etc/init.d/test') }
          it { is_expected.not_to contain_systemd__unit_file('test.service') }
          it do
            is_expected.to contain_service('neo4j').with('name' => 'test')
          end
        end
      end

      context 'with service_provider set to init' do
        let(:params) do
          {
            config_dir: '/etc/neo4j',
            data_prefix: '/var/lib/neo4j',
            group: 'neo4j',
            install_method: 'archive',
            neo4j_home: '/usr/neo4j',
            service_enable: true,
            service_ensure: 'running',
            service_name: 'neo4j',
            service_provider: 'init',
            service_shutdown_timeout: '120',
            service_ulimit: '60000',
            user: 'neo4j'
          }
        end
        it { is_expected.to contain_file('/etc/init.d/neo4j') }
        it { is_expected.not_to contain_systemd__unit_file('neo4j.service') }
        it do
          is_expected.to contain_service('neo4j').with('provider' => 'init')
        end

        context 'with user and group set to test' do
          let(:params) do
            {
              config_dir: '/etc/neo4j',
              data_prefix: '/var/lib/neo4j',
              group: 'test',
              install_method: 'archive',
              neo4j_home: '/usr/neo4j',
              service_enable: true,
              service_ensure: 'running',
              service_name: 'neo4j',
              service_provider: 'init',
              service_shutdown_timeout: '120',
              service_ulimit: '60000',
              user: 'test'
            }
          end
          it do
            is_expected.to contain_file('/etc/init.d/neo4j').with('group' => 'test',
                                                                  'owner' => 'test')
          end
        end

        context 'with service_name set to test' do
          let(:params) do
            {
              config_dir: '/etc/neo4j',
              data_prefix: '/var/lib/neo4j',
              group: 'neo4j',
              install_method: 'archive',
              neo4j_home: '/usr/neo4j',
              service_enable: true,
              service_ensure: 'running',
              service_name: 'test',
              service_provider: 'init',
              service_shutdown_timeout: '120',
              service_ulimit: '60000',
              user: 'neo4j'
            }
          end
          it { is_expected.to contain_file('/etc/init.d/test') }
          it { is_expected.not_to contain_systemd__unit_file('test.service') }
          it do
            is_expected.to contain_service('neo4j').with('name' => 'test')
          end
        end
      end

      context 'with service_provider set to redhat' do
        let(:params) do
          {
            config_dir: '/etc/neo4j',
            data_prefix: '/var/lib/neo4j',
            group: 'neo4j',
            install_method: 'archive',
            neo4j_home: '/usr/neo4j',
            service_enable: true,
            service_ensure: 'running',
            service_name: 'neo4j',
            service_provider: 'redhat',
            service_shutdown_timeout: '120',
            service_ulimit: '60000',
            user: 'neo4j'
          }
        end
        it { is_expected.to contain_file('/etc/init.d/neo4j') }
        it { is_expected.not_to contain_systemd__unit_file('neo4j.service') }
        it do
          is_expected.to contain_service('neo4j').with('provider' => 'redhat')
        end

        context 'with user and group set to test' do
          let(:params) do
            {
              config_dir: '/etc/neo4j',
              data_prefix: '/var/lib/neo4j',
              group: 'test',
              install_method: 'archive',
              neo4j_home: '/usr/neo4j',
              service_enable: true,
              service_ensure: 'running',
              service_name: 'neo4j',
              service_provider: 'redhat',
              service_shutdown_timeout: '120',
              service_ulimit: '60000',
              user: 'test'
            }
          end
          it do
            is_expected.to contain_file('/etc/init.d/neo4j').with('group' => 'test',
                                                                  'owner' => 'test')
          end
        end

        context 'with service_name set to test' do
          let(:params) do
            {
              config_dir: '/etc/neo4j',
              data_prefix: '/var/lib/neo4j',
              group: 'neo4j',
              install_method: 'archive',
              neo4j_home: '/usr/neo4j',
              service_enable: true,
              service_ensure: 'running',
              service_name: 'test',
              service_provider: 'redhat',
              service_shutdown_timeout: '120',
              service_ulimit: '60000',
              user: 'neo4j'
            }
          end
          it { is_expected.to contain_file('/etc/init.d/test') }
          it { is_expected.not_to contain_systemd__unit_file('test.service') }
          it do
            is_expected.to contain_service('neo4j').with('name' => 'test')
          end
        end
      end

      context 'with service_provider set to magic' do
        let(:params) do
          {
            config_dir: '/etc/neo4j',
            data_prefix: '/var/lib/neo4j',
            group: 'neo4j',
            install_method: 'archive',
            neo4j_home: '/usr/neo4j',
            service_enable: true,
            service_ensure: 'running',
            service_name: 'neo4j',
            service_provider: 'magic',
            service_shutdown_timeout: '120',
            service_ulimit: '60000',
            user: 'neo4j'
          }
        end
        it { is_expected.to raise_error(%r{Service provider magic not supported}) }
      end
    end

    context 'with service_ensure set to running' do
      it do
        is_expected.to contain_service('neo4j').with('ensure' => 'running')
      end
    end

    context 'with service_ensure set to stopped' do
      let(:params) do
        {
          config_dir: '/etc/neo4j',
          data_prefix: '/var/lib/neo4j',
          group: 'neo4j',
          install_method: 'package',
          neo4j_home: '/usr/neo4j',
          service_enable: true,
          service_ensure: 'stopped',
          service_name: 'neo4j',
          service_provider: 'systemd',
          service_shutdown_timeout: '120',
          service_ulimit: '60000',
          user: 'neo4j'
        }
      end
      it do
        is_expected.to contain_service('neo4j').with('ensure' => 'stopped')
      end
    end
  end

  context 'with service_enable set to false' do
    let(:params) do
      {
        config_dir: '/etc/neo4j',
        data_prefix: '/var/lib/neo4j',
        group: 'neo4j',
        install_method: 'package',
        neo4j_home: '/usr/neo4j',
        service_enable: false,
        service_ensure: 'running',
        service_name: 'neo4j',
        service_provider: 'systemd',
        service_shutdown_timeout: '120',
        service_ulimit: '60000',
        user: 'neo4j'
      }
    end
    it { is_expected.not_to contain_service('neo4j') }
  end
end
