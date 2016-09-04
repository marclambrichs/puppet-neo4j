# == Class: neo4j::config
#
# Config Neo4J (http://www.neo4j.com) on RHEL/Ubuntu/Debian from their
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
class neo4j::config (
  $config_dir = "${neo4j::neo4j_home}/conf"
)
{

  File {
    ensure  => file,
    mode    => '0644',
    before  => Service['neo4j'],
    notify  => Service['neo4j'],
  }

  $config_file = "${config_dir}/neo4j.conf"

  concat { $config_file :
    owner  => $neo4j::user,
    group  => $neo4j::group,
    mode   => '0644',
    before => Service['neo4j'],
    notify => Service['neo4j'],
  }

  ### neo4j.conf - general
  $allow_load_csv                = $neo4j::allow_load_csv
  $dbms_active_database          = $neo4j::dbms_active_database
  $dbms_allow_format_migration   = $neo4j::dbms_allow_format_migration
  $dbms_backup_address           = $neo4j::dbms_backup_address
  $dbms_backup_enabled           = $neo4j::dbms_backup_enabled
  $dbms_directories_certificates = $neo4j::dbms_directories_certificates
  $dbms_directories_data         = $neo4j::dbms_directories_data
  $dbms_directories_import       = $neo4j::dbms_directories_import
  $dbms_directories_plugins      = $neo4j::dbms_directories_plugins
  $dbms_memory_pagecache_size    = $neo4j::dbms_memory_pagecache_size
  $dbms_security_auth_enabled    = $neo4j::dbms_security_auth_enabled

  concat::fragment{ 'neo4j config general':
    target  => $config_file,
    content => template('neo4j/neo4j.conf.general.erb'),
    order   => 01,
  }

  ### neo4j.conf - network
  $dbms_connector_bolt_accept_non_local_connections  = $neo4j::dbms_connector_bolt_accept_non_local_connections
  $dbms_connector_http_accept_non_local_connections  = $neo4j::dbms_connector_http_accept_non_local_connections
  $dbms_connector_bolt_enabled                       = $neo4j::dbms_connector_bolt_enabled
  $dbms_connector_bolt_tls_level                     = $neo4j::dbms_connector_bolt_tls_level
  $dbms_connector_http_enabled                       = $neo4j::dbms_connector_http_enabled
  $dbms_connector_http_port                          = $neo4j::dbms_connector_http_port
  $dbms_connector_https_accept_non_local_connections = $neo4j::dbms_connector_https_accept_non_local_connections
  $dbms_connector_https_enabled                      = $neo4j::dbms_connector_https_enabled
  $dbms_connector_https_encryption                   = $neo4j::dbms_connector_https_encryption
  $dbms_connector_https_port                         = $neo4j::dbms_connector_https_port
  $dbms_threads_worker_count                         = $neo4j::dbms_threads_worker_count

  concat::fragment{ 'neo4j network connector config':
    target  => $config_file,
    content => template('neo4j/neo4j.conf.network.connector.erb'),
    order   => 02,
  }

  ### neo4j.conf - logging
  $dbms_logs_debug_rotation_keep_number = $neo4j::dbms_logs_debug_rotation_keep_number
  $dbms_logs_debug_rotation_size        = $neo4j::dbms_logs_debug_rotation_size
  $dbms_logs_gc_enabled                 = $neo4j::dbms_logs_gc_enabled
  $dbms_logs_gc_options                 = $neo4j::dbms_logs_gc_options
  $dbms_logs_gc_rotation_keep_number    = $neo4j::dbms_logs_gc_rotation_keep_number
  $dbms_logs_gc_rotation_size           = $neo4j::dbms_logs_gc_rotation_size
  $dbms_logs_http_enabled               = $neo4j::dbms_logs_http_enabled
  $dbms_logs_http_rotation_keep_number  = $neo4j::dbms_logs_http_rotation_keep_number
  $dbms_logs_http_rotation_size         = $neo4j::dbms_logs_http_rotation_size
  $dbms_logs_query_enabled              = $neo4j::dbms_logs_query_enabled
  $dbms_logs_query_rotation_keep_number = $neo4j::dbms_logs_query_rotation_keep_number
  $dbms_logs_query_rotation_size        = $neo4j::dbms_logs_query_rotation_size
  $dbms_logs_query_threshold            = $neo4j::dbms_logs_query_threshold

  concat::fragment{ 'neo4j logging config':
    target  => $config_file,
    content => template('neo4j/neo4j.conf.logging.erb'),
    order   => 03,
  }

  ### neo4j.conf - HA
  $dbms_mode                            = $neo4j::dbms_mode
  $dbms_security_ha_status_auth_enabled = $neo4j::dbms_security_ha_status_auth_enabled
  $ha_branched_data_policy              = $neo4j::ha_branched_data_policy
  $ha_heartbeat_interval                = $neo4j::ha_heartbeat_interval
  $ha_heartbeat_timeout                 = $neo4j::ha_heartbeat_timeout
  $ha_host_coordination                 = $neo4j::ha_host_coordination
  $ha_host_data                         = $neo4j::ha_host_data
  $ha_initial_hosts                     = $neo4j::ha_initial_hosts
  $ha_join_timeout                      = $neo4j::ha_join_timeout
  $ha_pull_interval                     = $neo4j::ha_pull_interval
  $ha_server_id                         = $neo4j::ha_server_id
  $ha_slave_only                        = $neo4j::ha_slave_only
  $ha_tx_push_factor                    = $neo4j::ha_tx_push_factor
  $ha_tx_push_strategy                  = $neo4j::ha_tx_push_strategy

  concat::fragment{ 'neo4j HA config':
    target  => $config_file,
    content => template('neo4j/neo4j.conf.ha.erb'),
    order   => 04,
  }

  ### neo4j.conf - miscellaneous
  $cypher_default_language_version               = $neo4j::cypher_default_language_version
  $dbms_checkpoint_iops_limit                    = $neo4j::dbms_checkpoint_iops_limit
  $dbms_ids_reuse_types_override                 = $neo4j::dbms_ids_reuse_types_override
  $dbms_read_only                                = $neo4j::dbms_read_only
  $dbms_security_allow_csv_import_from_file_urls = $neo4j::dbms_security_allow_csv_import_from_file_urls
  $dbms_shell_enabled                            = $neo4j::dbms_shell_enabled
  $dbms_shell_host                               = $neo4j::dbms_shell_host
  $dbms_shell_port                               = $neo4j::dbms_shell_port
  $dbms_tx_log_rotation_retention_policy         = $neo4j::dbms_tx_log_rotation_retention_policy
  $dbms_unmanaged_extension_classes              = $neo4j::dbms_unmanaged_extension_classes

  concat::fragment{ 'neo4j miscellaneous config':
    target  => $config_file,
    content => template('neo4j/neo4j.conf.misc.erb'),
    order   => 05,
  }

  concat::fragment{ 'neo4j conf footer':
    target  => $config_file,
    content => "\n\n#End of file\n",
    order   => 99,
  }

  ### Filling up neo4j-wrapper.conf
  $dbms_jvm_additional_commit_memory_to_process       = $neo4j::dbms_jvm_additional_commit_memory_to_process
  $dbms_jvm_additional_disable_explicit_gc            = $neo4j::dbms_jvm_additional_disable_explicit_gc
  $dbms_jvm_additional_hashcode                       = $neo4j::dbms_jvm_additional_hashcode
  $dbms_jvm_additional_jmxremote_port                 = $neo4j::dbms_jvm_additional_jmxremote_port
  $dbms_jvm_additional_jmxremote_access_file          = $neo4j::dbms_jvm_additional_jmxremote_access_file
  $dbms_jvm_additional_jmxremote_authenticate         = $neo4j::dbms_jvm_additional_jmxremote_authenticate
  $dbms_jvm_additional_jmxremote_password_file        = $neo4j::dbms_jvm_additional_jmxremote_password_file
  $dbms_jvm_additional_jmxremote_ssl                  = $neo4j::dbms_jvm_additional_jmxremote_ssl
  $dbms_jvm_additional_omit_stacktrace_in_fast_throw  = $neo4j::dbms_jvm_additional_omit_stacktrace_in_fast_throw
  $dbms_jvm_additional_rmi_server_hostname            = $neo4j::dbms_jvm_additional_rmi_server_hostname
  $dbms_jvm_additional_trust_final_non_static_fields  = $neo4j::dbms_jvm_additional_trust_final_non_static_fields
  $dbms_jvm_additional_unlock_experimental_vm_options = $neo4j::dbms_jvm_additional_unlock_experimental_vm_options
  $dbms_jvm_additional_unsupported_dbms_udc_source    = $neo4j::dbms_jvm_additional_unsupported_dbms_udc_source
  $dbms_jvm_additional_use_g1gc                       = $neo4j::dbms_jvm_additional_use_g1gc
  $dbms_memory_heap_initial_size                      = $neo4j::dbms_memory_heap_initial_size
  $dbms_memory_heap_max_size                          = $neo4j::dbms_memory_heap_max_size

  file { 'neo4j-wrapper.conf':
    path    => "${neo4j::neo4j_home}/conf/neo4j-wrapper.conf",
    content => template('neo4j/neo4j-wrapper.conf.erb'),
  }
}
