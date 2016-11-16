# == Class: neo4j
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
  $install_java     = $neo4j::install_java,
  $neo4j_bin        = $neo4j::neo4j_bin,
  $service_enable   = $neo4j::service_enable,
  $service_ensure   = $neo4j::service_ensure,
  $service_start    = $neo4j::service_start,
  $service_status   = $neo4j::service_status,
  $service_stop     = $neo4j::service_stop,
){
  service { 'neo4j':
    ensure   => $service_ensure,
    enable   => $service_enable,
    provider => base,
    start    => "${neo4j_bin}/${service_start}",
    status   => "${neo4j_bin}/${service_status}",
    stop     => "${neo4j_bin}/${service_stop}",
  }

  if ($install_java) {
    Class['java'] -> Service['neo4j']
  }
}
