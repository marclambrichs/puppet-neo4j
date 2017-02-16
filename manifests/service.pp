# == Class: neo4j::service
#
# Installs Neo4J (http://www.neo4j.com) on RHEL/Ubuntu/Debian from their
# distribution tarballs downloaded directly from their site.
#
# === Parameters
#
# @param group
# @param install_method
# @param service_enable
# @param service_ensure
# @param service_name
# @param service_provider
# @param user
#
# === Authors
#
# Marc Lambrichs <marc.lambrichs@gmail.com>
#
# === Copyright
#
# Copyright 2016 Marc Lambrichs, unless otherwise noted.
#
class neo4j::service (
  $group            = $::neo4j::group,
  $install_method   = $::neo4j::install_method,
  $service_enable   = $::neo4j::service_enable,
  $service_ensure   = $::neo4j::service_ensure,
  $service_name     = $::neo4j::service_name,
  $service_provider = $::neo4j::service_provider,
  $user             = $::neo4j::user,
){

  if $service_enable {
    if $install_method == 'source' {
      case $service_provider {
        'debian','init','redhat': {
          file { "/etc/init.d/${neo4j::service_name}":
            content => template('neo4j/service/neo4j.init.erb'),
            group   => $group,
            mode    => '0755',
            notify  => Service[$service_name],
            owner   => $user,
          }
        }
        'systemd': {
          ::systemd::unit_file { "${service_name}.service":
            content => template('neo4j/service/neo4j.service.erb'),
            before  => Service[$service_name],
          }
        }
        default: {
          fail("Service provider ${service_provider} not supported")
        }
      }
    }

    service { 'neo4j':
      ensure   => $service_ensure,
      enable   => $service_enable,
      name     => $service_name,
      provider => $service_provider,
    }
  }
}
