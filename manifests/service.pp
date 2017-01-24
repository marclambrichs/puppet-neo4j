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
  $service_provider = $neo4j::service_provider,
){
  service { 'neo4j':
    ensure   => $service_ensure,
    enable   => $service_enable,
    provider => $service_provider,
  }

  if ($install_java) {
    Class['java'] -> Service['neo4j']
  }
}
