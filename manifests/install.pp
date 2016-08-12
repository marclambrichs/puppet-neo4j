# == Class: neo4j::install
#
# Installs Neo4J (http://www.neo4j.com) on RHEL/Ubuntu/Debian from their
# distribution tarballs downloaded directly from their site.
#
#
# === Authors
#
# Marc Lambrichs <marc.lambrichs@gmail.com>
#
# === Copyright
#
# Copyright 2016 Marc Lambrichs, unless otherwise noted.
#
class neo4j::install ()
{
  ## package lsof is needed for init script
  if ! defined(Package['lsof']) {
    package { 'lsof' : }
  }

  file { $neo4j::install_prefix:
    ensure => directory,
  }

  file { $neo4j::data_dir:
    ensure => directory,
  }

  File[$neo4j::install_prefix] -> File[$neo4j::data_dir]

  if ( $neo4j::http_log_dir ){
    file { $neo4j::http_log_dir:
      ensure => directory,
      mode   => '0644'
    }
  }

  archive { $neo4j::package_tarball :
    ensure       => present,
    cleanup      => false,
    extract      => true,
    extract_path => $neo4j::install_prefix,
    path         => "${neo4j::install_prefix}/${neo4j::package_tarball}",
    filename     => $neo4j::package_tarball,
    source       => "https://neo4j.com/artifact.php?name=${neo4j::package_name}-unix.tar.gz",
    user         => 'neo4j',
    group        => 'neo4j',
    creates      => $neo4j::neo4j_home,
  } ->
  file { $neo4j::neo4j_home:
      ensure  => directory,
      owner   => $neo4j::user,
      group   => $neo4j::group,
      recurse => true,
      require => [User[$neo4j::user], Group[$neo4j::group]]
  }

  # install the service
  file {'/etc/init.d/neo4j':
    ensure  => link,
    target  => "${neo4j::neo4j_home}/bin/neo4j",
    require => Archive[$neo4j::package_tarball],
  }
}
