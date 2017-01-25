# == Class: neo4j::service
#
# Installs Neo4J (http://www.neo4j.com) on RHEL/Ubuntu/Debian from their
# distribution tarballs downloaded directly from their site.
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
  $group            = $neo4j::group,
  $install_java     = $neo4j::install_java,
  $neo4j_bin        = $neo4j::neo4j_bin,
  $service_enable   = $neo4j::service_enable,
  $service_ensure   = $neo4j::service_ensure,
  $service_name     = $neo4j::service_name,
  $service_provider = $neo4j::service_provider,
  $user             = $neo4j::user,
){

  if $service_enable {
    case $service_provider {
      'debian','init','redhat': {
        file { "/etc/init.d/${neo4j::service_name}":
          content => template('neo4j/neo4j.init.erb'),
          group   => $group,
          mode    => '0755',
          notify  => Service[$service_name],
          owner   => $user,
        }
      }
      'systemd': {
        ::systemd::unit_file { "${service_name}.service":
          content => template('neo4j/neo4j.service.erb'),
          before  => Service[$service_name],
        }
      }
      default: {
        fail("Service provider ${service_provider} not supported")
      }
    }

    service { $service_name:
      ensure   => $service_ensure,
      enable   => $service_enable,
      provider => $service_provider,
    }
  }

  if ($install_java) {
    Class['java'] -> Service['neo4j']
  }

}
