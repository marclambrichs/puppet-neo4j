# == Class: neo4j::params
#
class neo4j::params {
  $allow_load_csv                                     = false
  $cypher_default_language_version                    = 3.0
  $data_prefix                                        = undef
  $dbms_active_database                               = 'graph.db'
  $dbms_allow_format_migration                        = true
  $dbms_backup_address                                = '127.0.0.1:6362'
  $dbms_backup_enabled                                = true
  $dbms_checkpoint_iops_limit                         = 1000
  $dbms_connector_bolt_accept_non_local_connections   = false
  $dbms_connector_bolt_enabled                        = true
  $dbms_connector_bolt_port                           = 7687
  $dbms_connector_bolt_tls_level                      = 'OPTIONAL'
  $dbms_connector_http_accept_non_local_connections   = true
  $dbms_connector_http_enabled                        = true
  $dbms_connector_http_port                           = 7474
  $dbms_connector_https_accept_non_local_connections  = true
  $dbms_connector_https_enabled                       = true
  $dbms_connector_https_encryption                    = 'TLS'
  $dbms_connector_https_port                          = 7473
  $dbms_directories_certificates                      = 'certificates'
  $dbms_directories_data                              = 'data'
  $dbms_directories_import                            = 'import'
  $dbms_directories_plugins                           = 'plugins'
  $dbms_ids_reuse_types_override                      = [ 'node',
                                                          'relationship'
                                                        ]
  $dbms_jvm_additional_commit_memory_to_process       = '-XX:+AlwaysPreTouch'
  $dbms_jvm_additional_disable_explicit_gc            = '-XX:+DisableExplicitGC'
  $dbms_jvm_additional_hashcode                       = '-XX:hashCode=5'
  $dbms_jvm_additional_jmxremote_access_file          = 'jmx.access'
  $dbms_jvm_additional_jmxremote_authenticate         = true
  $dbms_jvm_additional_jmxremote_password_file        = 'jmx.password'
  $dbms_jvm_additional_jmxremote_port                 = 3637
  $dbms_jvm_additional_jmxremote_ssl                  = false
  $dbms_jvm_additional_omit_stacktrace_in_fast_throw  = '-XX:-OmitStackTraceInFastThrow'
  $dbms_jvm_additional_rmi_server_hostname            = $::fqdn
  $dbms_jvm_additional_trust_final_non_static_fields  = '-XX:+TrustFinalNonStaticFields'
  $dbms_jvm_additional_unlock_experimental_vm_options = '-XX:+UnlockExperimentalVMOptions'
  $dbms_jvm_additional_unsupported_dbms_udc_source    = 'tarball'
  $dbms_jvm_additional_use_g1gc                       = '-XX:+UseG1GC'
  $dbms_logs_debug_rotation_keep_number               = 7
  $dbms_logs_debug_rotation_size                      = '20m'
  $dbms_logs_gc_enabled                               = true
  $dbms_logs_gc_options                               = [
                                                          'PrintGCDetails',
                                                          'PrintGCDateStamps',
                                                          'PrintGCApplicationStoppedTime',
                                                          'PrintPromotionFailure',
                                                          'PrintTenuringDistribution'
                                                        ]
  $dbms_logs_gc_rotation_keep_number                  = 5
  $dbms_logs_gc_rotation_size                         = '20m'
  $dbms_logs_http_enabled                             = true
  $dbms_logs_http_rotation_keep_number                = 5
  $dbms_logs_http_rotation_size                       = '20m'
  $dbms_logs_query_enabled                            = true
  $dbms_logs_query_rotation_keep_number               = 7
  $dbms_logs_query_rotation_size                      = '20m'
  $dbms_logs_query_threshold                          = 0
  $dbms_memory_heap_initial_size                      = 512
  $dbms_memory_heap_max_size                          = 512
  $dbms_memory_pagecache_size                         = '10g'
  $dbms_mode                                          = 'HA'
  $dbms_read_only                                     = false
  $dbms_security_allow_csv_import_from_file_urls      = true
  $dbms_security_auth_enabled                         = false
  $dbms_security_ha_status_auth_enabled               = true
  $dbms_shell_enabled                                 = true
  $dbms_shell_host                                    = '127.0.0.1'
  $dbms_shell_port                                    = 1337
  $dbms_threads_worker_count                          = undef
  $dbms_tx_log_rotation_retention_policy              = '7 days'
  $dbms_unmanaged_extension_classes                   = {
                                                          'org.neo4j.examples.server.unmanaged' => '/examples/managed'
                                                        }
  $edition                                            = 'community'
  $group                                              = 'neo4j'
  $ha_branched_data_policy                            = 'keep_all'
  $ha_default_timeout                                 = 5
  $ha_heartbeat_interval                              = $ha_default_timeout
  $ha_heartbeat_timeout                               = 2 * $ha_heartbeat_interval
  $ha_host_coordination                               = '127.0.0.1:5001'
  $ha_host_data                                       = '127.0.0.1:6001'
  $ha_initial_hosts                                   = [ '127.0.0.1:5001',
                                                        ]
  $ha_join_timeout                                    = '30000'
  $ha_pull_interval                                   = 10
  $ha_server_id                                       = 1
  $ha_slave_only                                      = false
  $ha_tx_push_factor                                  = 1
  $ha_tx_push_strategy                                = 'fixed_ascending'
  $http_log_dir                                       = '/var/log/neo4j'
  $install_java                                       = true
  $install_method                                     = 'package'
  $install_prefix                                     = '/usr/share'
  $package_name                                       = 'neo4j'
  $source_release                                     = '3.0.7'
  $run_dir                                            = '/var/run'
  $service_enable                                     = true
  $service_ensure                                     = 'running'
  $service_start                                      = 'neo4j start'
  $service_status                                     = 'neo4j status'
  $service_stop                                       = 'neo4j stop'
  $user                                               = 'neo4j'
  $version                                            = '3.0.0'
}
