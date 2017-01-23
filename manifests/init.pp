# == Class: neo4j
#
# Installs Neo4J (http://www.neo4j.com) on RHEL/Ubuntu/Debian from their
# distribution tarballs downloaded directly from their site.
#
# === Parameters
#
# [*allow_load_csv*]
# [*cypher_default_language_version*]
# [*data_prefix*]
# [*dbms_active_database*]
# [*dbms_allow_format_migration*]
# [*dbms_backup_address*]
# [*dbms_backup_enabled*]
# [*dbms_checkpoint_iops_limit*]
# [*dbms_connector_bolt_accept_non_local_connections*]
# [*dbms_connector_bolt_port*]
# [*dbms_connector_bolt_tls_level*]
# [*dbms_connector_http_accept_non_local_connections*]
# [*dbms_connector_http_enabled*]
# [*dbms_connector_http_port*]
# [*dbms_connector_https_accept_non_local_connections*]
# [*dbms_connector_https_enabled*]
# [*dbms_connector_https_encryption*]
# [*dbms_connector_https_port*]
# [*dbms_directories_certificates*]
# [*dbms_directories_data*]
# [*dbms_directories_import*]
# [*dbms_directories_plugins*]
# [*dbms_ids_reuse_types_override*]
# [*dbms_jvm_additional_commit_memory_to_process*]
# [*dbms_jvm_additional_disable_explicit_gc*]
# [*dbms_jvm_additional_hashcode*]
# [*dbms_jvm_additional_jmxremote.port*]
# [*dbms_jvm_additional_jmxremote_access_file*]
# [*dbms_jvm_additional_jmxremote_authenticate*]
# [*dbms_jvm_additional_jmxremote_password_file*]
# [*dbms_jvm_additional_jmxremote_ssl*]
# [*dbms_jvm_additional_omit_stacktrace_in_fast_throw*]
# [*dbms_jvm_additional_trust_final_non_static_fields*]
# [*dbms_jvm_additional_unlock_experimental_vm_options*]
# [*dbms_jvm_additional_use_g1gc*]
# [*dbms_logs_debug_rotation_keep_number*]
# [*dbms_logs_debug_rotation_size*]
# [*dbms_logs_gc_enabled*]
# [*dbms_logs_gc_options.each*]
# [*dbms_logs_gc_rotation_keep_number*]
# [*dbms_logs_gc_rotation_size*]
# [*dbms_logs_http_enabled*]
# [*dbms_logs_http_rotation_keep_number*]
# [*dbms_logs_http_rotation_size*]
# [*dbms_logs_query_enabled*]
# [*dbms_logs_query_rotation_keep_number*]
# [*dbms_logs_query_rotation_size*]
# [*dbms_logs_query_threshold*]
# [*dbms_memory_heap_initial_size*]
# [*dbms_memory_heap_max_size*]
# [*dbms_memory_pagecache_size*]
# [*dbms_mode*]
# [*dbms_read_only*]
# [*dbms_security_allow_csv_import_from_file_urls*]
# [*dbms_security_auth_enabled*]
# [*dbms_security_ha_status_auth_enabled*]
# [*dbms_shell_enabled*]
# [*dbms_shell_host*]
# [*dbms_shell_port*]
# [*dbms_threads_worker_count*]
# [*dbms_tx_log_rotation_retention_policy*]
# [*dbms_unmanaged_extension_classes*]
# [*edition*]
# [*group*]
# [*ha_branched_data_policy*]
# [*ha_default_timeout*]
# [*ha_heartbeat_interval*]
# [*ha_heartbeat_timeout*]
# [*ha_host_coordination*]
# [*ha_host_data*]
# [*ha_initial_hosts*]
# [*ha_join_timeout*]
# [*ha_pull_interval*]
# [*ha_server_id*]
# [*ha_slave_only*]
# [*ha_tx_push_factor*]
# [*ha_tx_push_strategy*]
# [*http_log_dir*]
# [*install_java*]
# [*install_method*]
# [*install_prefix*]
# [*manage_repo*]
# [*package_name*]
# [*run_dir*]
# [*service_enable*]
# [*service_ensure*]
# [*service_provider]
# [*service_start*]
# [*service_status*]
# [*service_stop*]
# [*source_release*]
# [*user*]
# [*version*]
#
# === Examples
#
#  class { 'neo4j' :
#    source_release  => '3.0.4',
#    edition         => 'enterprise',
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

  $edition                                            = $neo4j::params::edition,
  $install_java                                       = $neo4j::params::install_java,
  $install_method                                     = $neo4j::params::install_method,
  $run_dir                                            = $neo4j::params::run_dir,
  $manage_repo                                        = $neo4j::params::manage_repo,
  $package_name                                       = $neo4j::params::package_name,
  $source_release                                     = $neo4j::params::source_release,
  $version                                            = $neo4j::params::version,

  ### variables install.pp
  $data_prefix                                        = $neo4j::params::data_prefix,
  $group                                              = $neo4j::params::group,
  $http_log_dir                                       = $neo4j::params::http_log_dir,
  $install_prefix                                     = $neo4j::params::install_prefix,
  $user                                               = $neo4j::params::user,

  ### variables service.pp
  $service_enable                                     = $neo4j::params::service_enable,
  $service_ensure                                     = $neo4j::params::service_ensure,
  $service_provider                                   = $neo4j::params::service_provider,
  $service_start                                      = $neo4j::params::service_start,
  $service_status                                     = $neo4j::params::service_status,
  $service_stop                                       = $neo4j::params::service_stop,

  ### variables neo4j.conf - general
  $allow_load_csv                                     = $neo4j::params::allow_load_csv,
  $dbms_active_database                               = $neo4j::params::dbms_active_database,
  $dbms_allow_format_migration                        = $neo4j::params::dbms_allow_format_migration,
  $dbms_backup_address                                = $neo4j::params::dbms_backup_address,
  $dbms_backup_enabled                                = $neo4j::params::dbms_backup_enabled,
  $dbms_directories_certificates                      = $neo4j::params::dbms_directories_certificates,
  $dbms_directories_data                              = $neo4j::params::dbms_directories_data,
  $dbms_directories_import                            = $neo4j::params::dbms_directories_import,
  $dbms_directories_plugins                           = $neo4j::params::dbms_directories_plugins,
  $dbms_memory_pagecache_size                         = $neo4j::params::dbms_memory_pagecache_size,
  $dbms_security_auth_enabled                         = $neo4j::params::dbms_security_auth_enabled,

  ### variables neo4j.conf - network
  $dbms_connector_bolt_accept_non_local_connections   = $neo4j::params::dbms_connector_bolt_accept_non_local_connections,
  $dbms_connector_bolt_enabled                        = $neo4j::params::dbms_connector_bolt_enabled,
  $dbms_connector_bolt_port                           = $neo4j::params::dbms_connector_bolt_port,
  $dbms_connector_bolt_tls_level                      = $neo4j::params::dbms_connector_bolt_tls_level,
  $dbms_connector_http_accept_non_local_connections   = $neo4j::params::dbms_connector_http_accept_non_local_connections,
  $dbms_connector_http_enabled                        = $neo4j::params::dbms_connector_http_enabled,
  $dbms_connector_http_port                           = $neo4j::params::dbms_connector_http_port,
  $dbms_connector_https_accept_non_local_connections  = $neo4j::params::dbms_connector_https_accept_non_local_connections,
  $dbms_connector_https_enabled                       = $neo4j::params::dbms_connector_https_enabled,
  $dbms_connector_https_encryption                    = $neo4j::params::dbms_connector_https_encryption,
  $dbms_connector_https_port                          = $neo4j::params::dbms_connector_https_port,
  $dbms_threads_worker_count                          = $neo4j::params::dbms_threads_worker_count,

  ### variables neo4j.conf - HA
  $dbms_mode                                          = $neo4j::params::dbms_mode,
  $dbms_security_ha_status_auth_enabled               = $neo4j::params::dbms_security_ha_status_auth_enabled,
  $ha_branched_data_policy                            = $neo4j::params::ha_branched_data_policy,
  $ha_default_timeout                                 = $neo4j::params::ha_default_timeout,
  $ha_heartbeat_interval                              = $neo4j::params::ha_heartbeat_interval,
  $ha_heartbeat_timeout                               = $neo4j::params::ha_heartbeat_timeout,
  $ha_host_coordination                               = $neo4j::params::ha_host_coordination,
  $ha_host_data                                       = $neo4j::params::ha_host_data,
  $ha_initial_hosts                                   = $neo4j::params::ha_initial_hosts,
  $ha_join_timeout                                    = $neo4j::params::ha_join_timeout,
  $ha_pull_interval                                   = $neo4j::params::ha_pull_interval,
  $ha_server_id                                       = $neo4j::params::ha_server_id,
  $ha_slave_only                                      = $neo4j::params::ha_slave_only,
  $ha_tx_push_factor                                  = $neo4j::params::ha_tx_push_factor,
  $ha_tx_push_strategy                                = $neo4j::params::ha_tx_push_strategy,

  ### variables neo4j.conf - logging
  $dbms_logs_debug_rotation_keep_number               = $neo4j::params::dbms_logs_debug_rotation_keep_number,
  $dbms_logs_debug_rotation_size                      = $neo4j::params::dbms_logs_debug_rotation_size,
  $dbms_logs_gc_enabled                               = $neo4j::params::dbms_logs_gc_enabled,
  $dbms_logs_gc_options                               = $neo4j::params::dbms_logs_gc_options,
  $dbms_logs_gc_rotation_keep_number                  = $neo4j::params::dbms_logs_gc_rotation_keep_number,
  $dbms_logs_gc_rotation_size                         = $neo4j::params::dbms_logs_gc_rotation_size,
  $dbms_logs_http_enabled                             = $neo4j::params::dbms_logs_http_enabled,
  $dbms_logs_http_rotation_keep_number                = $neo4j::params::dbms_logs_http_rotation_keep_number,
  $dbms_logs_http_rotation_size                       = $neo4j::params::dbms_logs_http_rotation_size,
  $dbms_logs_query_enabled                            = $neo4j::params::dbms_logs_query_enabled,
  $dbms_logs_query_rotation_keep_number               = $neo4j::params::dbms_logs_query_rotation_keep_number,
  $dbms_logs_query_rotation_size                      = $neo4j::params::dbms_logs_query_rotation_size,
  $dbms_logs_query_threshold                          = $neo4j::params::dbms_logs_query_threshold,

  ### variables neo4j.conf - miscellaneous
  $cypher_default_language_version                    = $neo4j::params::cypher_default_language_version,
  $dbms_checkpoint_iops_limit                         = $neo4j::params::dbms_checkpoint_iops_limit,
  $dbms_ids_reuse_types_override                      = $neo4j::params::dbms_ids_reuse_types_override,
  $dbms_read_only                                     = $neo4j::params::dbms_read_only,
  $dbms_security_allow_csv_import_from_file_urls      = $neo4j::params::dbms_security_allow_csv_import_from_file_urls,
  $dbms_shell_enabled                                 = $neo4j::params::dbms_shell_enabled,
  $dbms_shell_host                                    = $neo4j::params::dbms_shell_host,
  $dbms_shell_port                                    = $neo4j::params::dbms_shell_port,
  $dbms_tx_log_rotation_retention_policy              = $neo4j::params::dbms_tx_log_rotation_retention_policy,
  $dbms_unmanaged_extension_classes                   = $neo4j::params::dbms_unmanaged_extension_classes,

  ### variables neo4j-wrapper.conf
  $dbms_jvm_additional_commit_memory_to_process       = $neo4j::params::dbms_jvm_additional_commit_memory_to_process,
  $dbms_jvm_additional_disable_explicit_gc            = $neo4j::params::dbms_jvm_additional_disable_explicit_gc,
  $dbms_jvm_additional_hashcode                       = $neo4j::params::dbms_jvm_additional_hashcode,
  $dbms_jvm_additional_jmxremote_port                 = $neo4j::params::dbms_jvm_additional_jmxremote_port,
  $dbms_jvm_additional_jmxremote_access_file          = $neo4j::params::dbms_jvm_additional_jmxremote_access_file,
  $dbms_jvm_additional_jmxremote_authenticate         = $neo4j::params::dbms_jvm_additional_jmxremote_authenticate,
  $dbms_jvm_additional_jmxremote_password_file        = $neo4j::params::dbms_jvm_additional_jmxremote_password_file,
  $dbms_jvm_additional_jmxremote_ssl                  = $neo4j::params::dbms_jvm_additional_jmxremote_ssl,
  $dbms_jvm_additional_omit_stacktrace_in_fast_throw  = $neo4j::params::dbms_jvm_additional_omit_stacktrace_in_fast_throw,
  $dbms_jvm_additional_rmi_server_hostname            = $neo4j::params::dbms_jvm_additional_rmi_server_hostname,
  $dbms_jvm_additional_trust_final_non_static_fields  = $neo4j::params::dbms_jvm_additional_trust_final_non_static_fields,
  $dbms_jvm_additional_unlock_experimental_vm_options = $neo4j::params::dbms_jvm_additional_unlock_experimental_vm_options,
  $dbms_jvm_additional_unsupported_dbms_udc_source    = $neo4j::params::dbms_jvm_additional_unsupported_dbms_udc_source,
  $dbms_jvm_additional_use_g1gc                       = $neo4j::params::dbms_jvm_additional_use_g1gc,
  $dbms_memory_heap_initial_size                      = $neo4j::params::dbms_memory_heap_initial_size,
  $dbms_memory_heap_max_size                          = $neo4j::params::dbms_memory_heap_max_size,

) inherits neo4j::params {

  validate_absolute_path(
    $install_prefix,
    $http_log_dir,
    $run_dir
  )

  validate_bool(
    $allow_load_csv,
    $dbms_allow_format_migration,
    $dbms_backup_enabled,
    $dbms_connector_bolt_accept_non_local_connections,
    $dbms_connector_bolt_enabled,
    $dbms_connector_http_accept_non_local_connections,
    $dbms_connector_http_enabled,
    $dbms_connector_https_accept_non_local_connections,
    $dbms_connector_https_enabled,
    $dbms_jvm_additional_jmxremote_ssl,
    $dbms_logs_gc_enabled,
    $dbms_logs_http_enabled,
    $dbms_logs_query_enabled,
    $dbms_read_only,
    $dbms_security_allow_csv_import_from_file_urls,
    $dbms_security_auth_enabled,
    $dbms_security_ha_status_auth_enabled,
    $dbms_shell_enabled,
    $ha_slave_only,
    $install_java,
    $service_enable,
  )

  validate_integer([
    $dbms_checkpoint_iops_limit,
    $dbms_connector_bolt_port,
    $dbms_connector_http_port,
    $dbms_connector_https_port,
    $dbms_jvm_additional_jmxremote_port,
    $dbms_logs_debug_rotation_keep_number,
    $dbms_logs_gc_rotation_keep_number,
    $dbms_logs_http_rotation_keep_number,
    $dbms_logs_query_rotation_keep_number,
    $dbms_logs_query_threshold,
    $dbms_memory_heap_initial_size,
    $dbms_memory_heap_max_size,
    $dbms_shell_port,
    $ha_pull_interval,
  ])

  validate_re( $ha_join_timeout, '[1-9][0-9]*(ms|s|m)?' )

  validate_string(
    $dbms_active_database,
    $dbms_connector_bolt_tls_level,
    $dbms_connector_https_encryption,
    $dbms_directories_certificates,
    $dbms_directories_data,
    $dbms_directories_import,
    $dbms_directories_plugins,
    $dbms_mode,
    $dbms_tx_log_rotation_retention_policy,
    $group,
    $ha_branched_data_policy,
    $ha_tx_push_strategy,
    $user
  )

  #http://www.neo4j.com/customer/download/neo4j-enterprise-2.1.4-unix.tar.gz
  $source_name     = "neo4j-${edition}-${source_release}"
  $source_tarball = "${source_name}.tgz"

  if ( $::kernel != 'Linux' ) {
    fail('Only Linux is supported at this time.')
  }

  if !( $edition in ['community', 'enterprise'] ){
    fail('Only edtions \'community\' and \'enterprise\' are present.')
  }

  case $install_method {
    'package': {
      if ( versioncmp( $version, '3.0.0' ) < 0 ) {
        fail('Only versions >= 3.0.0 are supported at this time.')
      }
      $neo4j_home = "${install_prefix}/neo4j"
    }
    'archive': {
      if ( versioncmp( $source_release, '3.0.0' ) < 0 ) {
        fail('Only versions >= 3.0.0 are supported at this time.')
      }
      $neo4j_home = "${install_prefix}/${source_name}"
    }
    default: {
      fail("Installation method ${install_method} not supported.")
    }
  }
  $neo4j_bin = "${neo4j_home}/bin"

  if ( $data_prefix ) {
    if ( validate_absolute_path($data_prefix) ) {
      fail('$data_prefix should contain an absolute path')
    }
    $data_dir = $data_prefix
  } else {
    $data_dir = "${install_prefix}/data"
  }

  if ( $http_log_dir ) {
    $http_logfile = "${http_log_dir}/http.log"
  } else {
    $http_logfile = "${data_dir}/log/http.log"
  }

  if ( $dbms_mode == 'HA' ) {
    if ( !is_numeric( $ha_server_id ) ) {
      fail('The Server Id value must be specified and must numeric.')
    }
  }

  if ( $install_java ) {
    class { '::java':
      distribution => 'jdk',
      package      => 'java-1.8.0-openjdk'
    }
  }

  ## define the user and group the neo4j service will be running.
  group { $group:
    ensure => present
  } ->
  user { $user:
    ensure => present,
    gid    => $group,
    shell  => '/bin/bash',
    home   => $neo4j_home
  }

  anchor { 'neo4j::begin': } ->
  class{'::neo4j::install':} ->
  class{'::neo4j::config':} ~>
  class{'::neo4j::service':} ->
  anchor { 'neo4j::end': }
}
