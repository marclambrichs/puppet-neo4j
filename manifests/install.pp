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

  file { $neo4j::install_prefix:
    ensure => directory,
  }

  file { $neo4j::data_dir:
    ensure => directory,
  }

  File[$neo4j::install_prefix] -> File[$neo4j::data_dir]

  if ( ! $neo4j::http_log_dir ){
    file { $neo4j::http_log_dir:
      ensure => directory,
    }
  }

  if ! defined(Package['wget']) {
    package { 'wget' : }
  }
  if ! defined(Package['tar']) {
    package { 'tar' : }
  }
  if ! defined(Package['lsof']) {
    package { 'lsof' : }
  }

  # get the tgz file
  exec { "wget ${neo4j::package_tarball}" :
    command => "/usr/bin/wget \"http://www.neo4j.com/customer/download/${neo4j::package_name}-unix.tar.gz\" -O /tmp/${neo4j::package_tarball}",
    unless  => "/usr/bin/test -f /tmp/${neo4j::package_tarball}",
    notify  => Exec["untar ${neo4j::package_tarball}"],
    require => Package['wget']
  } ->

  # untar the tarball at the desired location
  exec { "untar ${neo4j::package_tarball}":
      command => "/bin/tar -xzf /tmp/${neo4j::package_tarball} -C ${neo4j::install_prefix}",
      unless  => "/usr/bin/test -f ${neo4j::neo4j_home}",
      require => [File[$neo4j::install_prefix], Package['tar']]
  } ->

  file { $neo4j::neo4j_home:
      ensure  => directory,
      owner   => $neo4j::user,
      group   => $neo4j::group,
      recurse => true,
      require => [User[$neo4j::user], Group[$neo4j::group]]
  }

#  file { "/tmp/${neo4j::package_tarball}":
#    ensure => absent
#  }

  # install the service
  file {'/etc/init.d/neo4j':
    ensure  => link,
    target  => "${neo4j::neo4j_home}/bin/neo4j",
    require => Exec["untar ${neo4j::package_tarball}"],
  }
}
