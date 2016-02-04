# == Class: neo4j
#
# Installs Neo4J (http://www.neo4j.com) on RHEL/Ubuntu/Debian from their
# distribution tarballs downloaded directly from their site.
#
# === Parameters
#
# [*address*]
#   Default: $::ipaddress
#
# [*allow_remote_connections*]
#   Boolean.
#   Default: true
#
# [*auth_ensure*]
#   Default: absent
#
# [*auth_admin_user*]
#   Default: undef
#
# [*auth_admin_password*]
#   Default: undef
#
# [*auth_users*]
#   Default: undef
#
# [*cache_memory_ratio*]
#   Available starting version 2.1.5
#   Default: undef
#
# [*cache_type*]
#   Default: undef
#
# [*edition*]
#   String. One of ['community', 'enterprise']
#   Default: 'community'
#
# [*ha_ensure*]
#   Default: absent
#
# [*ha_server_id*]
#   Default: undef
#
# [*ha_cluster_port*]
#   Default: '5001'
#
# [*ha_data_port*]
#   Default: '6001'
#
# [*ha_pull_interval*]
#   Default: undef
#
# [*ha_tx_push_factor*]
#   Default: undef
#
# [*ha_tx_push_strategy*]
#   Default: undef
#
# [*ha_allow_init_cluster*]
#   Default: true
#
# [*ha_slave_only*]
#   Default: false
#
# [*install_prefix*]
#   Prefix, indicating the directory where neo4j will be installed.
#   Default: '/opt/neo4j'
#
# [*jvm_init_memory*]
#   String.
#   Default: '1024'
#
# [*jvm_max_memory*]
#   String.
#   Default: '1024'
#
# [*keep_logical_logs*]
#   Default: '7 days'
#
# [*newrelic_jar_path*]
#   Default: undef
#
# [*node_cache_array_fraction*]
#   Default: undef
#
# [*node_cache_size*]
#   Default: undef
#
# [*nodestore_memory*]
#   Default: undef
#
# [*propertystore_memory*]
#   Default: undef
#
# [*propertystore_strings_memory*]
#   Default: undef
#
# [*propertystore_arrays_memory*]
#   Default: undef
#
# [*relationship_cache_array_fraction*]
#   Default: undef
#
# [*relationship_cache_size*]
#   Default: undef
#
# [*relationshipstore_memory*]
#   Default: undef
#
# [*service_ensure*]
#   Default: running
#
# [*service_enable*]
#   Default: true
#
# [*version*]
#   String, indicating the neo4j version
#
# === Examples
#
#  class { 'neo4j' :
#    version => '2.0.3',
#    edition => 'enterprise',
#  }
#
# See additional examples in the Readme.md file.
#
# === Authors
#
# Marc Lambrichs <marc.lambrichs@gmail.com>
#
# === Copyright
#
# Copyright 2016 Marc Lambrichs, unless otherwise noted.
#
class neo4j (
  $address                           = $neo4j::params::address,
  $allow_remote_connections          = $neo4j::params::allow_remote_connections,
  $auth_admin_password               = $neo4j::params::auth_admin_password,
  $auth_admin_user                   = $neo4j::params::auth_admin_user,
  $auth_ensure                       = $neo4j::params::auth_ensure,
  $auth_users                        = $neo4j::params::auth_users,
  $cache_memory_ratio                = $neo4j::params::cache_memory_ratio,
  $cache_type                        = $neo4j::params::cache_type,
  $edition                           = $neo4j::params::edition,
  $ha_allow_init_cluster             = $neo4j::params::ha_allow_init_cluster,
  $ha_ensure                         = $neo4j::params::ha_ensure,
  $ha_server_id                      = $neo4j::params::ha_server_id,
  $ha_cluster_port                   = $neo4j::params::ha_cluster_port,
  $ha_data_port                      = $neo4j::params::ha_data_port,
  $ha_pull_interval                  = $neo4j::params::ha_pull_interval,
  $ha_slave_only                     = $neo4j::params::ha_slave_only,
  $ha_tx_push_factor                 = $neo4j::params::ha_tx_push_factor,
  $ha_tx_push_strategy               = $neo4j::params::ha_tx_push_strategy,
  $install_prefix                    = $neo4j::params::install_prefix,
  $jvm_init_memory                   = $neo4j::params::jvm_init_memory,
  $jvm_max_memory                    = $neo4j::params::jvm_max_memory,
  $keep_logical_logs                 = $neo4j::params::keep_logical_logs,
  $newrelic_jar_path                 = $neo4j::params::newrelic_jar_path,
  $node_cache_array_fraction         = $neo4j::params::node_cache_array_fraction,
  $node_cache_size                   = $neo4j::params::node_cache_size,
  $nodestore_memory                  = $neo4j::params::nodestore_memory,
  $propertystore_arrays_memory       = $neo4j::params::propertystore_arrays_memory,
  $propertystore_memory              = $neo4j::params::propertystore_memory,
  $propertystore_strings_memory      = $neo4j::params::propertystore_strings_memory,
  $relationship_cache_array_fraction = $neo4j::params::relationship_cache_array_fraction,
  $relationship_cache_size           = $neo4j::params::relationship_cache_size,
  $relationshipstore_memory          = $neo4j::params::relationshipstore_memory,
  $service_enable                    = $neo4j::params::service_enable,
  $service_ensure                    = $neo4j::params::service_ensure,
  $version                           = $neo4j::params::version
) inherits neo4j::params {

  #http://www.neo4j.com/customer/download/neo4j-enterprise-2.1.4-unix.tar.gz
  $package_name    = "neo4j-${edition}-${version}"
  $package_tarball = "${package_name}.tgz"

  if($::kernel != 'Linux') {
    fail('Only Linux is supported at this time.')
  }
  if(versioncmp($version, '2.0.0') < 0) {
    fail('Only versions >= 2.0.0 are supported at this time.')
  }
  if($ha_ensure != absent) {
    if(!is_numeric($ha_server_id)) {
      fail('The Server Id value must be specified and must numeric.')
    }
  }

  if($cache_memory_ratio) {
    if(versioncmp($version, '2.1.5') < 0) {
      warning("Ignoring the cache_memory_ratio value due to version being '${version}'.")
    }
    elsif(!is_numeric($cache_memory_ratio) or $cache_memory_ratio < 0.0 or
      $cache_memory_ratio > 100.0) {
        fail("Invalid cache_memory_ratio value of '${cache_memory_ratio}'. It must be in the range of 0.0 to 100.0.")
    }
  }

  user { 'neo4j':
    ensure => present,
    gid    => 'neo4j',
    shell  => '/bin/bash',
    home   => $install_prefix
  }
  group { 'neo4j':
    ensure => present
  }

  File {
    owner => 'neo4j',
    group => 'neo4j',
    mode  => '0644'
  }

  Exec {
    path => ['/usr/bin', '/usr/local/bin', '/bin', '/sbin']
  }

  contain neo4j::install
  contain neo4j::config
  if ( $auth_ensure == present ) {
    contain neo4j::authentication
  }
  contain neo4j::service

  Class['neo4j::install'] ->
  Class['neo4j::config'] ~>
  Class['neo4j::service']
}
