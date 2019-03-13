require 'spec_helper'

describe 'neo4j', :type => :class do
  on_os_under_test.each do |os, facts|
    context "on #{os}" do
      let(:facts) { facts }

      context 'with defaults for all parameters' do
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('neo4j') }
        it { is_expected.to contain_anchor('neo4j::begin').that_comes_before('Class[neo4j::Install]') }
        it { is_expected.to contain_class('neo4j::install').that_comes_before('Class[neo4j::Config]') }
        it { is_expected.to contain_class('neo4j::config').that_notifies('Class[neo4j::Service]') }
        it { is_expected.to contain_class('neo4j::service').that_comes_before('Anchor[neo4j::end]') }
        it { is_expected.to contain_anchor('neo4j::end') }

        case facts[:osfamily]
        when 'Debian'
        case facts[:operatingsystemrelease]
        when /(^7.*|^14\.04.*)/
          it { is_expected.to contain_service('neo4j').with({
            ensure: 'running',
            enable: true,
            name: 'neo4j',
            provider: 'debian',
            })
          }
        else
          it { is_expected.to contain_service('neo4j').with({
            ensure: 'running',
            enable: true,
            name: 'neo4j',
            provider: 'systemd',
            })
          }
        end
        when 'RedHat'
        case facts[:operatingsystemrelease]
        when /^6.*/
          it { is_expected.to contain_service('neo4j').with({
            ensure: 'running',
            enable: true,
            name: 'neo4j',
            provider: 'redhat',
            })
          }
        else
          it { is_expected.to contain_service('neo4j').with({
              ensure: 'running',
              enable: true,
              name: 'neo4j',
              provider: 'systemd',
            })
          }
        end
        end

        it { is_expected.not_to contain_file('/etc/init.d/neo4j') }
        it { is_expected.not_to contain_systemd__unit('neo4j.service') }
      end

      context 'with install method set to archive' do
        let(:params) do
          {
            install_method: 'archive',
            install_prefix: '/usr/share',
            version: '3.1.1',
          }
        end

        context 'with service_provider set to magic' do
          let(:params) do
            {
              install_method: 'archive',
              install_prefix: '/usr/share',
              service_provider: 'magic',
              version: '3.1.1',
            }
          end

          it { is_expected.to raise_error(/\"magic\" does not match \"debian|init|redhat|systemd\"/) }
        end

        case facts[:osfamily]
        when 'Debian'
          case facts[:operatingsystemrelease]
          when %r{(^7.*|^14\.04.*)}
            it { is_expected.to contain_file('/etc/init.d/neo4j') }
            it { is_expected.not_to contain_systemd__unit('neo4j.service') }

            context 'with user and group set to test' do
              let(:params) do
                {
                  group: 'test',
                  install_method: 'archive',
                  install_prefix: '/usr/share',
                  version: '3.1.1',
                  user: 'test',
                }
              end
 
              it { is_expected.to contain_file('/etc/init.d/neo4j').with(
                  group: 'test',
                  owner: 'test',
                )
              }
            end

            context 'with service_name set to test' do
              let(:params) do
                {
                  group: 'test',
                  install_method: 'archive',
                  install_prefix: '/usr/share',
                  version: '3.1.1',
                  user: 'test',
                  service_name: 'test',
                }
              end

              it { is_expected.to contain_file('/etc/init.d/test') }
            end
          else
            it { is_expected.not_to contain_file('/etc/init.d/neo4j') }
            it { is_expected.to contain_systemd__unit_file('neo4j.service') }
          end
        when 'RedHat'
          case facts[:operatingsystemrelease]
          when %r{^6.*}
            it { is_expected.to contain_file('/etc/init.d/neo4j') }
            it { is_expected.not_to contain_systemd__unit('neo4j.service') }

            context 'with user and group set to test' do
              let(:params) do
                {
                  group: 'test',
                  install_method: 'archive',
                  install_prefix: '/usr/share',
                  version: '3.1.1',
                  user: 'test',
                }
              end

              it { is_expected.to contain_file('/etc/init.d/neo4j').with(
                  group: 'test',
                  owner: 'test',
                )
              }
            end

            context 'with service_name set to test' do
              let(:params) do
                {
                  group: 'test',
                  install_method: 'archive',
                  install_prefix: '/usr/share',
                  version: '3.1.1',
                  user: 'test',
                  service_name: 'test',
                }
              end

              it { is_expected.to contain_file('/etc/init.d/test') }
            end
          else
            it { is_expected.not_to contain_file('/etc/init.d/neo4j') }
            it { is_expected.to contain_systemd__unit_file('neo4j.service') }
          end
        end
      end
    end
  end
end
