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
  $install_method  = $neo4j::install_method,
  $install_prefix  = $neo4j::install_prefix,
  $neo4j_home      = $neo4j::neo4j_home,
  $package_name    = $neo4j::package_name,
  $source_tarball  = $neo4j::source_tarball,
  $source_name     = $neo4j::source_name,
  $user            = $neo4j::user,
  $version         = $neo4j::version,
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

  case $install_method {
    'package': {
      package { $package_name:
        ensure => $version,
      }
    }
    'archive': {
      archive { $source_tarball:
        ensure       => present,
        cleanup      => false,
        extract      => true,
        extract_path => $install_prefix,
        path         => "/tmp/${source_tarball}",
        filename     => $source_tarball,
        source       => "https://neo4j.com/artifact.php?name=${source_name}-unix.tar.gz",
        user         => $user,
        group        => $group,
        creates      => "${neo4j_home}/bin",
        require      => File[$neo4j_home],
      }
    }
    default: {
      fail("Installation method ${install_method} not supported.")
    }
  }
}
