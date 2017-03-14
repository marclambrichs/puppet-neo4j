# == Class: neo4j::params
#
class neo4j::params {
  $browser_allow_outgoing_connections                                = true
  $browser_credential_timeout                                        = '0'
  $browser_remote_content_hostname_whitelist                         = ['http://guides.neo4j.com',
                                                                        'https://guides.neo4j.com',
                                                                        'http://localhost',
                                                                        'https://localhost'
]
  $browser_retain_connection_credentials                             = true
  $causal_clustering_array_block_id_allocation_size                  = 1024
  $causal_clustering_catchup_batch_size                              = 64
  $causal_clustering_cluster_allow_reads_on_followers                = false
  $causal_clustering_cluster_routing_ttl                             = '300000'
  $causal_clustering_cluster_topology_refresh                        = '60000'
  $causal_clustering_disable_middleware_logging                      = true
  $causal_clustering_discovery_advertised_address                    = "${::fqdn}:5000"
  $causal_clustering_discovery_listen_address                        = '0.0.0.0:5000'
  $causal_clustering_expected_core_cluster_size                      = 3
  $causal_clustering_global_session_tracker_state_size               = 1000
  $causal_clustering_id_alloc_state_size                             = 1000
  $causal_clustering_initial_discovery_members                       = []
  $causal_clustering_join_catch_up_timeout                           = '600000'
  $causal_clustering_label_token_id_allocation_size                  = 32
  $causal_clustering_label_token_name_id_allocation_size             = 1024
  $causal_clustering_last_applied_state_size                         = 1000
  $causal_clustering_leader_election_timeout                         = '7000'
  $causal_clustering_log_shipping_max_lag                            = 256
  $causal_clustering_neostore_block_id_allocation_size               = 1024
  $causal_clustering_node_id_allocation_size                         = 1024
  $causal_clustering_node_labels_id_allocation_size                  = 1024
  $causal_clustering_outgoing_queue_size                             = 64
  $causal_clustering_property_id_allocation_size                     = 1024
  $causal_clustering_property_key_token_id_allocation_size           = 32
  $causal_clustering_property_key_token_name_id_allocation_size      = 1024
  $causal_clustering_pull_interval                                   = '1000'
  $causal_clustering_raft_advertised_address                         = "${::fqdn}:7000"
  $causal_clustering_raft_listen_address                             = '0.0.0.0:7000'
  $causal_clustering_raft_log_implementation                         = 'SEGMENTED'
  $causal_clustering_raft_log_prune_strategy                         = '1g size'
  $causal_clustering_raft_log_pruning_frequency                      = '600000'
  $causal_clustering_raft_log_reader_pool_size                       = 8
  $causal_clustering_raft_log_rotation_size                          = '250m'
  $causal_clustering_raft_membership_state_size                      = 1000
  $causal_clustering_raft_messages_log_enable                        = false
  $causal_clustering_raft_term_state_size                            = 1000
  $causal_clustering_raft_vote_state_size                            = 1000
  $causal_clustering_read_replica_refresh_rate                       = '5000'
  $causal_clustering_read_replica_time_to_live                       = '60000'
  $causal_clustering_relationship_group_id_allocation_size           = 1024
  $causal_clustering_relationship_id_allocation_size                 = 1024
  $causal_clustering_relationship_type_token_id_allocation_size      = 32
  $causal_clustering_relationship_type_token_name_id_allocation_size = 1024
  $causal_clustering_replicated_lock_token_state_size                = 1000
  $causal_clustering_schema_id_allocation_size                       = 1024
  $causal_clustering_state_machine_apply_max_batch_size              = 16
  $causal_clustering_state_machine_flush_window_size                 = 4096
  $causal_clustering_string_block_id_allocation_size                 = 1024
  $causal_clustering_transaction_advertised_address                  = "${::fqdn}:6000"
  $causal_clustering_transaction_listen_address                      = '0.0.0.0:6000'
  $causal_clustering_unknown_address_logging_throttle                = '10000'
  $cypher_default_language_version                                   = 'default'
  $cypher_forbid_exhaustive_shortestpath                             = false
  $cypher_hints_error                                                = false
  $cypher_min_replan_interval                                        = '10000'
  $cypher_planner                                                    = 'default'
  $cypher_statistics_divergence_threshold                            = 0.75
  $data_prefix                                                       = '/var/lib/neo4j'
  $dbms_active_database                                              = 'graph.db'
  $dbms_allow_format_migration                                       = false
  $dbms_backup_address                                               = '127.0.0.1:6362'
  $dbms_backup_enabled                                               = true
  $dbms_checkpoint_interval_time                                     = '300000'
  $dbms_checkpoint_interval_tx                                       = 100000
  $dbms_checkpoint_iops_limit                                        = 1000
  $dbms_connector_bolt_advertised_address                            = undef
  $dbms_connector_bolt_enabled                                       = true
  $dbms_connector_bolt_listen_address                                = ':9000'
  $dbms_connector_http_advertised_address                            = undef
  $dbms_connector_http_enabled                                       = true
  $dbms_connector_http_listen_address                                = ':7474'
  $dbms_connector_https_advertised_address                           = undef
  $dbms_connector_https_enabled                                      = true
  $dbms_connector_https_listen_address                               = ':7473'
  $dbms_connectors_default_advertised_address                        = $::fqdn
  $dbms_connectors_default_listen_address                            = '0.0.0.0'
  $dbms_ids_reuse_types_override                                     = [ 'RELATIONSHIP', 'NODE']
  $dbms_index_sampling_background_enabled                            = true
  $dbms_index_sampling_buffer_size                                   = '64m'
  $dbms_index_sampling_sample_size_limit                             = 8388608
  $dbms_index_sampling_update_percentage                             = 5
  $dbms_index_searcher_cache_size                                    = 2147483647
  $dbms_jvm_additional_commit_memory_to_process                      = '-XX:+AlwaysPreTouch'
  $dbms_jvm_additional_disable_explicit_gc                           = '-XX:+DisableExplicitGC'
  $dbms_jvm_additional_ephemeral_dh_keysize                          = '-Djdk.tls.ephemeralDHKeySize=2048'
  $dbms_jvm_additional_hashcode                                      = '-XX:hashCode=5'
  $dbms_jvm_additional_jmxremote_access_file                         = 'jmx.access'
  $dbms_jvm_additional_jmxremote_authenticate                        = true
  $dbms_jvm_additional_jmxremote_password_file                       = 'jmx.password'
  $dbms_jvm_additional_jmxremote_port                                = 3637
  $dbms_jvm_additional_jmxremote_ssl                                 = false
  $dbms_jvm_additional_omit_stacktrace_in_fast_throw                 = '-XX:-OmitStackTraceInFastThrow'
  $dbms_jvm_additional_rmi_server_hostname                           = '-Djava.rmi.server.hostname='
  $dbms_jvm_additional_ssl_keystore                                  = ''
  $dbms_jvm_additional_ssl_keystore_password                         = ''
  $dbms_jvm_additional_ssl_truststore                                = ''
  $dbms_jvm_additional_ssl_truststore_password                       = ''
  $dbms_jvm_additional_trust_final_non_static_fields                 = '-XX:+TrustFinalNonStaticFields'
  $dbms_jvm_additional_unlock_experimental_vm_options                = '-XX:+UnlockExperimentalVMOptions'
  $dbms_jvm_additional_unsupported_dbms_udc_source                   = 'tarball'
  $dbms_jvm_additional_use_g1gc                                      = '-XX:+UseG1GC'
  $dbms_logs_debug_level                                             = 'INFO'
  $dbms_logs_debug_rotation_delay                                    = '300000'
  $dbms_logs_debug_rotation_keep_number                              = 7
  $dbms_logs_debug_rotation_size                                     = '20m'
  $dbms_logs_gc_enabled                                              = false
  $dbms_logs_gc_options                                              = ['-XX:+PrintGCDetails',
                                                                        '-XX:+PrintGCDateStamps',
                                                                        '-XX:+PrintGCApplicationStoppedTime',
                                                                        '-XX:+PrintPromotionFailure',
                                                                        '-XX:+PrintTenuringDistribution' ]
  $dbms_logs_gc_rotation_keep_number                                 = 5
  $dbms_logs_gc_rotation_size                                        = '20m'
  $dbms_logs_http_enabled                                            = true
  $dbms_logs_http_rotation_keep_number                               = 5
  $dbms_logs_http_rotation_size                                      = '20m'
  $dbms_logs_query_enabled                                           = false
  $dbms_logs_query_parameter_logging_enabled                         = true
  $dbms_logs_query_rotation_keep_number                              = 7
  $dbms_logs_query_rotation_size                                     = '20m'
  $dbms_logs_query_threshold                                         = '0'
  $dbms_logs_security_level                                          = 'INFO'
  $dbms_logs_security_rotation_delay                                 = '300s'
  $dbms_logs_security_rotation_keep_number                           = 7
  $dbms_logs_security_rotation_size                                  = '20m'
  $dbms_memory_heap_initial_size                                     = '512m'
  $dbms_memory_heap_max_size                                         = '512m'
  $dbms_memory_pagecache_size                                        = '240k'
  $dbms_memory_pagecache_swapper                                     = undef
  $dbms_mode                                                         = 'SINGLE'
  $dbms_query_cache_size                                             = 1000
  $dbms_read_only                                                    = false
  $dbms_record_format                                                = 'standard'
  $dbms_relationship_grouping_threshold                              = 50
  $dbms_rest_transaction_idle_timeout                                = '60000'
  $dbms_security_allow_csv_import_from_file_urls                     = true
  $dbms_security_allow_publisher_create_token                        = false
  $dbms_security_auth_cache_max_capacity                             = 10000
  $dbms_security_auth_cache_ttl                                      = '10m'
  $dbms_security_auth_enabled                                        = true
  $dbms_security_auth_provider                                       = 'native'
  $dbms_security_ha_status_auth_enabled                              = true
  $dbms_security_http_authorization_classes                          = undef
  $dbms_security_ldap_authentication_cache_enabled                   = true
  $dbms_security_ldap_authentication_mechanism                       = 'simple'
  $dbms_security_ldap_authentication_user_dn_template                = 'uid={0},ou=users,dc=example,dc=com'
  $dbms_security_ldap_authorization_group_membership_attributes      = [ 'memberOf' ]
  $dbms_security_ldap_authorization_group_to_role_mapping            = undef
  $dbms_security_ldap_authorization_system_password                  = 'secret'
  $dbms_security_ldap_authorization_system_username                  = 'cn=search-account,cn=Users,dc=example,dc=com'
  $dbms_security_ldap_authorization_use_system_account               = false
  $dbms_security_ldap_authorization_user_search_base                 = 'cn=users,dc=example,dc=com'
  $dbms_security_ldap_authorization_user_search_filter               = '(&(objectClass=*)(uid={0}))'
  $dbms_security_ldap_connection_timeout                             = '30000'
  $dbms_security_ldap_host                                           = 'localhost'
  $dbms_security_ldap_read_timeout                                   = '30000'
  $dbms_security_ldap_referral                                       = 'follow'
  $dbms_security_ldap_use_starttls                                   = false
  $dbms_security_log_successful_authentication                       = true
  $dbms_security_procedures_default_allowed                          = ''
  $dbms_security_procedures_roles                                    = ''
  $dbms_shell_enabled                                                = false
  $dbms_shell_host                                                   = '127.0.0.1'
  $dbms_shell_port                                                   = 1337
  $dbms_shell_read_only                                              = false
  $dbms_shell_rmi_name                                               = 'shell'
  $dbms_threads_worker_count                                         = 1
  $dbms_transaction_timeout                                          = '0'
  $dbms_tx_log_rotation_retention_policy                             = '7 days'
  $dbms_tx_log_rotation_size                                         = '250m'
  $dbms_udc_enabled                                                  = false
  $dbms_unmanaged_extension_classes                                  = []
  $dbms_windows_service_name                                         = undef
  $edition                                                           = 'community'
  $group                                                             = 'neo4j'
  $ha_allow_init_cluster                                             = true
  $ha_branched_data_copying_strategy                                 = 'branch_then_copy'
  $ha_branched_data_policy                                           = 'keep_all'
  $ha_broadcast_timeout                                              = '30000'
  $ha_configuration_timeout                                          = '1000'
  $ha_data_chunk_size                                                = '2m'
  $ha_default_timeout                                                = '5000'
  $ha_election_timeout                                               = '5000'
  $ha_heartbeat_interval                                             = '5000'
  $ha_heartbeat_timeout                                              = '40000'
  $ha_host_coordination                                              = '0.0.0.0:5001'
  $ha_host_data                                                      = '0.0.0.0:6001'
  $ha_initial_hosts                                                  = []
  $ha_internal_role_switch_timeout                                   = '10000'
  $ha_join_timeout                                                   = '30000'
  $ha_learn_timeout                                                  = '5000'
  $ha_leave_timeout                                                  = '30000'
  $ha_max_acceptors                                                  = 21
  $ha_max_channels_per_slave                                         = 20
  $ha_paxos_timeout                                                  = '5000'
  $ha_phase1_timeout                                                 = '5000'
  $ha_phase2_timeout                                                 = '5000'
  $ha_pull_batch_size                                                = 100
  $ha_pull_interval                                                  = '0'
  $ha_role_switch_timeout                                            = '120000'
  $ha_server_id                                                      = 1
  $ha_slave_lock_timeout                                             = '20000'
  $ha_slave_only                                                     = false
  $ha_slave_read_timeout                                             = '20000'
  $ha_tx_push_factor                                                 = 1
  $ha_tx_push_strategy                                               = 'fixed_ascending'
  $install_method                                                    = 'package'
  $jmx_enable                                                        = false
  $manage_repo                                                       = false
  $metrics_bolt_messages_enabled                                     = false
  $metrics_csv_enabled                                               = false
  $metrics_csv_interval                                              = '3m'
  $metrics_csv_path                                                  = 'metrics'
  $metrics_cypher_replanning_enabled                                 = false
  $metrics_enabled                                                   = false
  $metrics_graphite_enabled                                          = false
  $metrics_graphite_interval                                         = '3m'
  $metrics_graphite_server                                           = '127.0.0.1:2003'
  $metrics_jvm_buffers_enabled                                       = false
  $metrics_jvm_gc_enabled                                            = false
  $metrics_jvm_memory_enabled                                        = false
  $metrics_jvm_threads_enabled                                       = false
  $metrics_neo4j_causal_clustering_enabled                           = false
  $metrics_neo4j_checkpointing_enabled                               = false
  $metrics_neo4j_cluster_enabled                                     = false
  $metrics_neo4j_counts_enabled                                      = false
  $metrics_neo4j_enabled                                             = false
  $metrics_neo4j_logrotation_enabled                                 = false
  $metrics_neo4j_network_enabled                                     = false
  $metrics_neo4j_pagecache_enabled                                   = false
  $metrics_neo4j_server_enabled                                      = false
  $metrics_neo4j_tx_enabled                                          = false
  $metrics_prefix                                                    = 'neo4j'
  $release_deb                                                       = 'stable'
  $release_rpm                                                       = 'stable'
  $service_enable                                                    = true
  $service_ensure                                                    = 'running'
  $service_name                                                      = 'neo4j'
  $service_ulimit                                                    = 60000
  $service_shutdown_timeout                                          = 120
  $tools_consistency_checker_check_graph                             = true
  $tools_consistency_checker_check_indexes                           = true
  $tools_consistency_checker_check_label_scan_store                  = true
  $tools_consistency_checker_check_property_owners                   = false
  $unsupported_dbms_security_ldap_authorization_connection_pooling   = true
  $user                                                              = 'neo4j'

  case $::osfamily {
    'RedHat': {
      case $::operatingsystemrelease {
        /^6.*/ : {
          $install_prefix   = '/usr/share'
          $service_provider = 'redhat'
        }
        default : {
          $install_prefix   = '/usr/share'
          $service_provider = 'systemd'
        }
      }
      $dbms_directories_certificates = 'certificates'
      $dbms_directories_data         = 'data'
      $dbms_directories_import       = 'import'
      $dbms_directories_lib          = '/usr/share/neo4j/lib'
      $dbms_directories_logs         = '/var/log/neo4j'
      $dbms_directories_metrics      = 'metrics'
      $dbms_directories_plugins      = 'plugins'
      $dbms_directories_run          = '/var/run/neo4j'
      $default_file                  = '/etc/sysconfig/neo4j'
      $version                       = 'installed'
    }
    'Debian': {
      case $::operatingsystemrelease {
        /(^7.*|^14\.04.*)/ : {
          $service_provider = 'debian'
        }
        default : {
          $service_provider = 'systemd'
        }
      }
      $dbms_directories_certificates = 'certificates'
      $dbms_directories_data         = 'data'
      $dbms_directories_import       = 'import'
      $dbms_directories_lib          = '/usr/share/neo4j/lib'
      $dbms_directories_logs         = '/var/log/neo4j'
      $dbms_directories_metrics      = 'metrics'
      $dbms_directories_plugins      = 'plugins'
      $dbms_directories_run          = '/var/run/neo4j'
      $default_file                  = '/etc/default/neo4j'
      $install_prefix                = '/usr'
      $version                       = 'installed'
    }
    default: {
      fail( "Unsupported OS family: ${::osfamily}" )
    }
  }
}
