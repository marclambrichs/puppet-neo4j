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
class neo4j::install (
  $data_dir        = $neo4j::data_dir,
  $group           = $neo4j::group,
  $http_log_dir    = $neo4j::http_log_dir,
  $install_prefix  = $neo4j::install_prefix,
  $neo4j_home      = $neo4j::neo4j_home,
  $package_tarball = $neo4j::package_tarball,
  $user            = $neo4j::user,
)
{
  ## package lsof is needed for init script
  if ! defined(Package['lsof']) {
    package { 'lsof' : }
  }

  file { $install_prefix:
    ensure => directory,
  }

  file { $data_dir:
    ensure => directory,
  }

  File[$install_prefix] -> File[$data_dir]

  if ( $http_log_dir ){
    file { $http_log_dir:
      ensure => directory,
      mode   => '0644'
    }
  }

  file { $neo4j_home:
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => '0755',
    require => [User[$user], Group[$group]]
  }

  archive { $package_tarball :
    ensure       => present,
    cleanup      => false,
    extract      => true,
    extract_path => $install_prefix,
    path         => "/tmp/${neo4j::package_tarball}",
    filename     => $package_tarball,
    source       => "https://neo4j.com/artifact.php?name=${neo4j::package_name}-unix.tar.gz",
    user         => $user,
    group        => $group,
    creates      => "${neo4j::neo4j_home}/bin",
    require      => File[$neo4j_home],
  }

}
