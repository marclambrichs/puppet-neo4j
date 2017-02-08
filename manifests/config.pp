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
# Copyright 2016-2017 Marc Lambrichs, unless otherwise noted.
#
class neo4j::config (
  $default_file = $neo4j::default_file,
  $config_dir   = "${::neo4j::neo4j_home}/conf",
  $jmx_enable   = $::neo4j::jmx_enable,
  $version      = $::neo4j::version,
){
  ### variables default/sysconfig
  $service_shutdown_timeout = $neo4j::service_shutdown_timeout
  $service_ulimit           = $neo4j::service_ulimit

  file { 'neo4j-default':
    path    => $default_file,
    content => template('neo4j/configuration/default.erb'),
  }

  File {
    ensure  => file,
    mode    => '0600',
    owner  => $::neo4j::user,
    group  => $::neo4j::group,
    before  => Service['neo4j'],
    notify  => Service['neo4j'],
  }

  $config_file = "${config_dir}/neo4j.conf"

  concat { $config_file :
    owner  => $::neo4j::user,
    group  => $::neo4j::group,
    mode   => '0644',
    before => Service['neo4j'],
    notify => Service['neo4j'],
  }

  ###
  ### neo4j.conf - general
  ###
  $browser_allow_outgoing_connections               = $::neo4j::browser_allow_outgoing_connections
  $browser_credential_timeout                       = $::neo4j::browser_credential_timeout
  $browser_remote_content_hostname_whitelist        = $::neo4j::browser_remote_content_hostname_whitelist
  $browser_retain_connection_credentials            = $::neo4j::browser_retain_connection_credentials
  $cypher_default_language_version                  = $::neo4j::cypher_default_language_version
  $cypher_forbid_exhaustive_shortestpath            = $::neo4j::cypher_forbid_exhaustive_shortestpath
  $cypher_hints_error                               = $::neo4j::cypher_hints_error
  $cypher_min_replan_interval                       = $::neo4j::cypher_min_replan_interval
  $cypher_planner                                   = $::neo4j::cypher_planner
  $cypher_statistics_divergence_threshold           = $::neo4j::cypher_statistics_divergence_threshold
  $dbms_active_database                             = $::neo4j::dbms_active_database
  $dbms_allow_format_migration                      = $::neo4j::dbms_allow_format_migration
  $dbms_checkpoint_interval_time                    = $::neo4j::dbms_checkpoint_interval_time
  $dbms_checkpoint_interval_tx                      = $::neo4j::dbms_checkpoint_interval_tx
  $dbms_checkpoint_iops_limit                       = $::neo4j::dbms_checkpoint_iops_limit
  $dbms_ids_reuse_types_override                    = $::neo4j::dbms_ids_reuse_types_override
  $dbms_index_sampling_background_enabled           = $::neo4j::dbms_index_sampling_background_enabled
  $dbms_index_sampling_buffer_size                  = $::neo4j::dbms_index_sampling_buffer_size
  $dbms_index_sampling_sample_size_limit            = $::neo4j::dbms_index_sampling_sample_size_limit
  $dbms_index_sampling_update_percentage            = $::neo4j::dbms_index_sampling_update_percentage
  $dbms_index_searcher_cache_size                   = $::neo4j::dbms_index_searcher_cache_size
  $dbms_logs_debug_level                            = $::neo4j::dbms_logs_debug_level
  $dbms_logs_debug_rotation_delay                   = $::neo4j::dbms_logs_debug_rotation_delay
  $dbms_logs_debug_rotation_keep_number             = $::neo4j::dbms_logs_debug_rotation_keep_number
  $dbms_logs_debug_rotation_size                    = $::neo4j::dbms_logs_debug_rotation_size
  $dbms_logs_gc_enabled                             = $::neo4j::dbms_logs_gc_enabled
  $dbms_logs_gc_options                             = $::neo4j::dbms_logs_gc_options
  $dbms_logs_gc_rotation_keep_number                = $::neo4j::dbms_logs_gc_rotation_keep_number
  $dbms_logs_gc_rotation_size                       = $::neo4j::dbms_logs_gc_rotation_size
  $dbms_logs_http_enabled                           = $::neo4j::dbms_logs_http_enabled
  $dbms_logs_http_rotation_keep_number              = $::neo4j::dbms_logs_http_rotation_keep_number
  $dbms_logs_http_rotation_size                     = $::neo4j::dbms_logs_http_rotation_size
  $dbms_logs_security_level                         = $::neo4j::dbms_logs_security_level
  $dbms_logs_security_rotation_delay                = $::neo4j::dbms_logs_security_rotation_delay
  $dbms_memory_pagecache_size                       = $::neo4j::dbms_memory_pagecache_size
  $dbms_memory_pagecache_swapper                    = $::neo4j::dbms_memory_pagecache_swapper
  $dbms_mode                                        = $::neo4j::dbms_mode
  $dbms_read_only                                   = $::neo4j::dbms_read_only
  $dbms_record_format                               = $::neo4j::dbms_record_format
  $dbms_relationship_grouping_threshold             = $::neo4j::dbms_relationship_grouping_threshold
  $dbms_rest_transaction_idle_timeout               = $::neo4j::dbms_rest_transaction_idle_timeout
  $dbms_security_allow_csv_import_from_file_urls    = $::neo4j::dbms_security_allow_csv_import_from_file_urls
  $dbms_shell_enabled                               = $::neo4j::dbms_shell_enabled
  $dbms_shell_host                                  = $::neo4j::dbms_shell_host
  $dbms_shell_read_only                             = $::neo4j::dbms_shell_read_only
  $dbms_shell_rmi_name                              = $::neo4j::dbms_shell_rmi_name
  $dbms_tx_log_rotation_size                        = $::neo4j::dbms_tx_log_rotation_size
  $dbms_udc_enabled                                 = $::neo4j::dbms_udc_enabled
  $dbms_unmanaged_extension_classes                 = $::neo4j::dbms_unmanaged_extension_classes
  $dbms_directories_certificates                    = $::neo4j::dbms_directories_certificates
  $dbms_directories_data                            = $::neo4j::dbms_directories_data
  $dbms_directories_import                          = $::neo4j::dbms_directories_import
  $dbms_directories_lib                             = $::neo4j::dbms_directories_lib
  $dbms_directories_logs                            = $::neo4j::dbms_directories_logs
  $dbms_directories_metrics                         = $::neo4j::dbms_directories_metrics
  $dbms_directories_plugins                         = $::neo4j::dbms_directories_plugins
  $dbms_directories_run                             = $::neo4j::dbms_directories_run
  $dbms_shell_port                                  = $::neo4j::dbms_shell_port
  $dbms_tx_log_rotation_retention_policy            = $::neo4j::dbms_tx_log_rotation_retention_policy
  $tools_consistency_checker_check_graph            = $::neo4j::tools_consistency_checker_check_graph
  $tools_consistency_checker_check_indexes          = $::neo4j::tools_consistency_checker_check_indexes
  $tools_consistency_checker_check_label_scan_store = $::neo4j::tools_consistency_checker_check_label_scan_store
  $tools_consistency_checker_check_property_owners  = $::neo4j::tools_consistency_checker_check_property_owners

  concat::fragment{ 'neo4j config general':
    target  => $config_file,
    content => template('neo4j/configuration/neo4j.conf.general.erb'),
    order   => '01',
  }

  #-----------------------------------------------------------------------------
  # 3.6. Configure Neo4j connectors
  #-----------------------------------------------------------------------------
  $dbms_connector_bolt_advertised_address     = $::neo4j::dbms_connector_bolt_advertised_address
  $dbms_connector_bolt_enabled                = $::neo4j::dbms_connector_bolt_enabled
  $dbms_connector_bolt_listen_address         = $::neo4j::dbms_connector_bolt_listen_address
  $dbms_connector_http_advertised_address     = $::neo4j::dbms_connector_http_advertised_address
  $dbms_connector_http_enabled                = $::neo4j::dbms_connector_http_enabled
  $dbms_connector_http_listen_address         = $::neo4j::dbms_connector_http_listen_address
  $dbms_connector_https_advertised_address    = $::neo4j::dbms_connector_https_advertised_address
  $dbms_connector_https_enabled               = $::neo4j::dbms_connector_https_enabled
  $dbms_connector_https_listen_address        = $::neo4j::dbms_connector_https_listen_address
  $dbms_connectors_default_advertised_address = $::neo4j::dbms_connectors_default_advertised_address
  $dbms_connectors_default_listen_address     = $::neo4j::dbms_connectors_default_listen_address
  $dbms_threads_worker_count                  = $::neo4j::dbms_threads_worker_count

  if ( $version =~ /[\d.]+/ and versioncmp( $version, '3.0.0' ) == 0 ) {
    concat::fragment{ 'neo4j config connectors':
      target  => $config_file,
      content => template('neo4j/configuration/connectors/3.0/neo4j.conf.connectors.3.0.erb'),
      order   => '36',
    }
  } else {
    concat::fragment{ 'neo4j config connectors':
      target  => $config_file,
      content => template('neo4j/configuration/connectors/3.1/neo4j.conf.connectors.3.1.erb'),
      order   => '36',
    }
  }

  #-----------------------------------------------------------------------------
  # 4.1. Causal Cluster
  #-----------------------------------------------------------------------------
  $causal_clustering_array_block_id_allocation_size                  = $::neo4j::causal_clustering_array_block_id_allocation_size
  $causal_clustering_catchup_batch_size                              = $::neo4j::causal_clustering_catchup_batch_size
  $causal_clustering_cluster_allow_reads_on_followers                = $::neo4j::causal_clustering_cluster_allow_reads_on_followers
  $causal_clustering_cluster_routing_ttl                             = $::neo4j::causal_clustering_cluster_routing_ttl
  $causal_clustering_cluster_topology_refresh                        = $::neo4j::causal_clustering_cluster_topology_refresh
  $causal_clustering_disable_middleware_logging                      = $::neo4j::causal_clustering_disable_middleware_logging
  $causal_clustering_discovery_advertised_address                    = $::neo4j::causal_clustering_discovery_advertised_address
  $causal_clustering_discovery_listen_address                        = $::neo4j::causal_clustering_discovery_listen_address
  $causal_clustering_expected_core_cluster_size                      = $::neo4j::causal_clustering_expected_core_cluster_size
  $causal_clustering_global_session_tracker_state_size               = $::neo4j::causal_clustering_global_session_tracker_state_size
  $causal_clustering_id_alloc_state_size                             = $::neo4j::causal_clustering_id_alloc_state_size
  $causal_clustering_initial_discovery_members                       = $::neo4j::causal_clustering_initial_discovery_members
  $causal_clustering_join_catch_up_timeout                           = $::neo4j::causal_clustering_join_catch_up_timeout
  $causal_clustering_label_token_id_allocation_size                  = $::neo4j::causal_clustering_label_token_id_allocation_size
  $causal_clustering_label_token_name_id_allocation_size             = $::neo4j::causal_clustering_label_token_name_id_allocation_size
  $causal_clustering_last_applied_state_size                         = $::neo4j::causal_clustering_last_applied_state_size
  $causal_clustering_leader_election_timeout                         = $::neo4j::causal_clustering_leader_election_timeout
  $causal_clustering_log_shipping_max_lag                            = $::neo4j::causal_clustering_log_shipping_max_lag
  $causal_clustering_neostore_block_id_allocation_size               = $::neo4j::causal_clustering_neostore_block_id_allocation_size
  $causal_clustering_node_id_allocation_size                         = $::neo4j::causal_clustering_node_id_allocation_size
  $causal_clustering_node_labels_id_allocation_size                  = $::neo4j::causal_clustering_node_labels_id_allocation_size
  $causal_clustering_outgoing_queue_size                             = $::neo4j::causal_clustering_outgoing_queue_size
  $causal_clustering_property_id_allocation_size                     = $::neo4j::causal_clustering_property_id_allocation_size
  $causal_clustering_property_key_token_id_allocation_size           = $::neo4j::causal_clustering_property_key_token_id_allocation_size
  $causal_clustering_property_key_token_name_id_allocation_size      = $::neo4j::causal_clustering_property_key_token_name_id_allocation_size
  $causal_clustering_pull_interval                                   = $::neo4j::causal_clustering_pull_interval
  $causal_clustering_raft_advertised_address                         = $::neo4j::causal_clustering_raft_advertised_address
  $causal_clustering_raft_listen_address                             = $::neo4j::causal_clustering_raft_listen_address
  $causal_clustering_raft_log_implementation                         = $::neo4j::causal_clustering_raft_log_implementation
  $causal_clustering_raft_log_prune_strategy                         = $::neo4j::causal_clustering_raft_log_prune_strategy
  $causal_clustering_raft_log_pruning_frequency                      = $::neo4j::causal_clustering_raft_log_pruning_frequency
  $causal_clustering_raft_log_reader_pool_size                       = $::neo4j::causal_clustering_raft_log_reader_pool_size
  $causal_clustering_raft_log_rotation_size                          = $::neo4j::causal_clustering_raft_log_rotation_size
  $causal_clustering_raft_membership_state_size                      = $::neo4j::causal_clustering_raft_membership_state_size
  $causal_clustering_raft_messages_log_enable                        = $::neo4j::causal_clustering_raft_messages_log_enable
  $causal_clustering_raft_term_state_size                            = $::neo4j::causal_clustering_raft_term_state_size
  $causal_clustering_raft_vote_state_size                            = $::neo4j::causal_clustering_raft_vote_state_size
  $causal_clustering_read_replica_refresh_rate                       = $::neo4j::causal_clustering_read_replica_refresh_rate
  $causal_clustering_read_replica_time_to_live                       = $::neo4j::causal_clustering_read_replica_time_to_live
  $causal_clustering_relationship_group_id_allocation_size           = $::neo4j::causal_clustering_relationship_group_id_allocation_size
  $causal_clustering_relationship_id_allocation_size                 = $::neo4j::causal_clustering_relationship_id_allocation_size
  $causal_clustering_relationship_type_token_id_allocation_size      = $::neo4j::causal_clustering_relationship_type_token_id_allocation_size
  $causal_clustering_relationship_type_token_name_id_allocation_size = $::neo4j::causal_clustering_relationship_type_token_name_id_allocation_size
  $causal_clustering_replicated_lock_token_state_size                = $::neo4j::causal_clustering_replicated_lock_token_state_size
  $causal_clustering_schema_id_allocation_size                       = $::neo4j::causal_clustering_schema_id_allocation_size
  $causal_clustering_state_machine_apply_max_batch_size              = $::neo4j::causal_clustering_state_machine_apply_max_batch_size
  $causal_clustering_state_machine_flush_window_size                 = $::neo4j::causal_clustering_state_machine_flush_window_size
  $causal_clustering_string_block_id_allocation_size                 = $::neo4j::causal_clustering_string_block_id_allocation_size
  $causal_clustering_transaction_advertised_address                  = $::neo4j::causal_clustering_transaction_advertised_address
  $causal_clustering_transaction_listen_address                      = $::neo4j::causal_clustering_transaction_listen_address
  $causal_clustering_unknown_address_logging_throttle                = $::neo4j::causal_clustering_unknown_address_logging_throttle

  if ( $version =~ /[\d.]+/ and versioncmp( $version, '3.0.0' ) > 0 ) {
    concat::fragment{ 'neo4j config causal cluster':
      target  => $config_file,
      content => template('neo4j/configuration/clustering/neo4j.conf.clustering.causal.erb'),
      order   => '41',
    }
  }

  #-----------------------------------------------------------------------------
  # 4.2. Highly Available Cluster
  #-----------------------------------------------------------------------------
  $ha_allow_init_cluster             = $::neo4j::ha_allow_init_cluster
  $ha_branched_data_copying_strategy = $::neo4j::ha_branched_data_copying_strategy
  $ha_branched_data_policy           = $::neo4j::ha_branched_data_policy
  $ha_broadcast_timeout              = $::neo4j::ha_broadcast_timeout
  $ha_configuration_timeout          = $::neo4j::ha_configuration_timeout
  $ha_default_timeout                = $::neo4j::ha_default_timeout
  $ha_election_timeout               = $::neo4j::ha_election_timeout
  $ha_heartbeat_interval             = $::neo4j::ha_heartbeat_interval
  $ha_heartbeat_timeout              = $::neo4j::ha_heartbeat_timeout
  $ha_host_coordination              = $::neo4j::ha_host_coordination
  $ha_host_data                      = $::neo4j::ha_host_data
  $ha_initial_hosts                  = $::neo4j::ha_initial_hosts
  $ha_internal_role_switch_timeout   = $::neo4j::ha_internal_role_switch_timeout
  $ha_join_timeout                   = $::neo4j::ha_join_timeout
  $ha_learn_timeout                  = $::neo4j::ha_learn_timeout
  $ha_leave_timeout                  = $::neo4j::ha_leave_timeout
  $ha_max_acceptors                  = $::neo4j::ha_max_acceptors
  $ha_max_channels_per_slave         = $::neo4j::ha_max_channels_per_slave
  $ha_paxos_timeout                  = $::neo4j::ha_paxos_timeout
  $ha_phase1_timeout                 = $::neo4j::ha_phase1_timeout
  $ha_phase2_timeout                 = $::neo4j::ha_phase2_timeout
  $ha_pull_batch_size                = $::neo4j::ha_pull_batch_size
  $ha_pull_interval                  = $::neo4j::ha_pull_interval
  $ha_role_switch_timeout            = $::neo4j::ha_role_switch_timeout
  $ha_server_id                      = $::neo4j::ha_server_id
  $ha_slave_lock_timeout             = $::neo4j::ha_slave_lock_timeout
  $ha_slave_only                     = $::neo4j::ha_slave_only
  $ha_slave_read_timeout             = $::neo4j::ha_slave_read_timeout
  $ha_tx_push_factor                 = $::neo4j::ha_tx_push_factor
  $ha_tx_push_strategy               = $::neo4j::ha_tx_push_strategy

  concat::fragment{ 'neo4j config HA cluster':
    target  => $config_file,
    content => template('neo4j/configuration/clustering/neo4j.conf.clustering.ha.erb'),
    order   => '42',
  }

  #-----------------------------------------------------------------------------
  # 6.1.1. Enabling backups
  #-----------------------------------------------------------------------------
  $dbms_backup_address = $::neo4j::dbms_backup_address
  $dbms_backup_enabled = $::neo4j::dbms_backup_enabled

  concat::fragment{ 'neo4j config backups':
    target  => $config_file,
    content => template('neo4j/configuration/neo4j.conf.backup.erb'),
    order   => '61',
  }

  #-----------------------------------------------------------------------------
  # 7.1. Authentication and authorization
  #-----------------------------------------------------------------------------
  $dbms_security_allow_publisher_create_token                   = $::neo4j::dbms_security_allow_publisher_create_token
  $dbms_security_auth_cache_max_capacity                        = $::neo4j::dbms_security_auth_cache_max_capacity
  $dbms_security_auth_cache_ttl                                 = $::neo4j::dbms_security_auth_cache_ttl
  $dbms_security_auth_enabled                                   = $::neo4j::dbms_security_auth_enabled
  $dbms_security_auth_provider                                  = $::neo4j::dbms_security_auth_provider
  $dbms_security_ha_status_auth_enabled                         = $::neo4j::dbms_security_ha_status_auth_enabled
  $dbms_security_http_authorization_classes                     = $::neo4j::dbms_security_http_authorization_classes
  $dbms_security_ldap_authentication_cache_enabled              = $::neo4j::dbms_security_ldap_authentication_cache_enabled
  $dbms_security_ldap_authentication_mechanism                  = $::neo4j::dbms_security_ldap_authentication_mechanism
  $dbms_security_ldap_authentication_user_dn_template           = $::neo4j::dbms_security_ldap_authentication_user_dn_template
  $dbms_security_ldap_authorization_group_membership_attributes = $::neo4j::dbms_security_ldap_authorization_group_membership_attributes
  $dbms_security_ldap_authorization_group_to_role_mapping       = $::neo4j::dbms_security_ldap_authorization_group_to_role_mapping
  $dbms_security_ldap_authorization_system_password             = $::neo4j::dbms_security_ldap_authorization_system_password
  $dbms_security_ldap_authorization_system_username             = $::neo4j::dbms_security_ldap_authorization_system_username
  $dbms_security_ldap_authorization_use_system_account          = $::neo4j::dbms_security_ldap_authorization_use_system_account
  $dbms_security_ldap_authorization_user_search_base            = $::neo4j::dbms_security_ldap_authorization_user_search_base
  $dbms_security_ldap_authorization_user_search_filter          = $::neo4j::dbms_security_ldap_authorization_user_search_filter
  $dbms_security_ldap_connection_timeout                        = $::neo4j::dbms_security_ldap_connection_timeout
  $dbms_security_ldap_host                                      = $::neo4j::dbms_security_ldap_host
  $dbms_security_ldap_read_timeout                              = $::neo4j::dbms_security_ldap_read_timeout
  $dbms_security_ldap_referral                                  = $::neo4j::dbms_security_ldap_referral
  $dbms_security_ldap_use_starttls                              = $::neo4j::dbms_security_ldap_use_starttls
  $dbms_security_procedures_default_allowed                     = $::neo4j::dbms_security_procedures_default_allowed
  $dbms_security_procedures_roles                               = $::neo4j::dbms_security_procedures_roles

  if ( $version =~ /[\d.]+/ and versioncmp( $version, '3.0.0' ) == 0 ) {
    concat::fragment{ 'neo4j config authentication and authorization':
      target  => $config_file,
      content => template('neo4j/configuration/security/3.0/neo4j.conf.authentication.erb'),
      order   => '71',
    }
  } else {
    concat::fragment{ 'neo4j config authentication and authorization':
      target  => $config_file,
      content => template('neo4j/configuration/security/3.1/neo4j.conf.authentication.erb'),
      order   => '71',
    }
  }


  #-----------------------------------------------------------------------------
  # 8.1. Metrics
  #-----------------------------------------------------------------------------
  $metrics_bolt_messages_enabled           = $::neo4j::metrics_bolt_messages_enabled
  $metrics_csv_enabled                     = $::neo4j::metrics_csv_enabled
  $metrics_csv_interval                    = $::neo4j::metrics_csv_interval
  $metrics_csv_path                        = $::neo4j::metrics_csv_path
  $metrics_cypher_replanning_enabled       = $::neo4j::metrics_cypher_replanning_enabled
  $metrics_enabled                         = $::neo4j::metrics_enabled
  $metrics_graphite_enabled                = $::neo4j::metrics_graphite_enabled
  $metrics_graphite_interval               = $::neo4j::metrics_graphite_interval
  $metrics_graphite_server                 = $::neo4j::metrics_graphite_server
  $metrics_jvm_buffers_enabled             = $::neo4j::metrics_jvm_buffers_enabled
  $metrics_jvm_gc_enabled                  = $::neo4j::metrics_jvm_gc_enabled
  $metrics_jvm_memory_enabled              = $::neo4j::metrics_jvm_memory_enabled
  $metrics_jvm_threads_enabled             = $::neo4j::metrics_jvm_threads_enabled
  $metrics_neo4j_causal_clustering_enabled = $::neo4j::metrics_neo4j_causal_clustering_enabled
  $metrics_neo4j_checkpointing_enabled     = $::neo4j::metrics_neo4j_checkpointing_enabled
  $metrics_neo4j_cluster_enabled           = $::neo4j::metrics_neo4j_cluster_enabled
  $metrics_neo4j_counts_enabled            = $::neo4j::metrics_neo4j_counts_enabled
  $metrics_neo4j_enabled                   = $::neo4j::metrics_neo4j_enabled
  $metrics_neo4j_logrotation_enabled       = $::neo4j::metrics_neo4j_logrotation_enabled
  $metrics_neo4j_network_enabled           = $::neo4j::metrics_neo4j_network_enabled
  $metrics_neo4j_pagecache_enabled         = $::neo4j::metrics_neo4j_pagecache_enabled
  $metrics_neo4j_server_enabled            = $::neo4j::metrics_neo4j_server_enabled
  $metrics_neo4j_tx_enabled                = $::neo4j::metrics_neo4j_tx_enabled
  $metrics_prefix                          = $::neo4j::metrics_prefix

  if ( $version =~ /[\d.]+/ and versioncmp( $version, '3.0.0' ) > 0 ) {
    concat::fragment{ 'neo4j config metrics logging':
      target  => $config_file,
      content => template('neo4j/configuration/monitoring/neo4j.conf.monitoring.metrics.erb'),
      order   => '81',
    }
  }

  #-----------------------------------------------------------------------------
  # 8.2. Logging
  #-----------------------------------------------------------------------------
  $dbms_logs_query_enabled                     = $::neo4j::dbms_logs_query_enabled
  $dbms_logs_query_parameter_logging_enabled   = $::neo4j::dbms_logs_query_parameter_logging_enabled
  $dbms_logs_query_rotation_size               = $::neo4j::dbms_logs_query_rotation_size
  $dbms_logs_query_threshold                   = $::neo4j::dbms_logs_query_threshold
  $dbms_logs_security_rotation_keep_number     = $::neo4j::dbms_logs_security_rotation_keep_number
  $dbms_logs_security_rotation_size            = $::neo4j::dbms_logs_security_rotation_size
  $dbms_security_log_successful_authentication = $::neo4j::dbms_security_log_successful_authentication
  $dbms_logs_query_rotation_keep_number        = $::neo4j::dbms_logs_query_rotation_keep_number

  concat::fragment{ 'neo4j config logging':
    target  => $config_file,
    content => template('neo4j/configuration/monitoring/neo4j.conf.monitoring.logging.erb'),
    order   => '82',
  }

  #-----------------------------------------------------------------------------
  # 8.3. Query management
  #-----------------------------------------------------------------------------
  $dbms_transaction_timeout = $::neo4j::dbms_transaction_timeout

  concat::fragment{ 'neo4j config query management':
    target  => $config_file,
    content => template('neo4j/configuration/monitoring/neo4j.conf.monitoring.query_management.erb'),
    order   => '83',
  }

  ###
  ### neo4j-wrapper.conf
  ###
  $dbms_jvm_additional_commit_memory_to_process       = $::neo4j::dbms_jvm_additional_commit_memory_to_process
  $dbms_jvm_additional_disable_explicit_gc            = $::neo4j::dbms_jvm_additional_disable_explicit_gc
  $dbms_jvm_additional_hashcode                       = $::neo4j::dbms_jvm_additional_hashcode
  $dbms_jvm_additional_jmxremote_authenticate         = $::neo4j::dbms_jvm_additional_jmxremote_authenticate
  $dbms_jvm_additional_jmxremote_access_file          = $::neo4j::dbms_jvm_additional_jmxremote_access_file
  $dbms_jvm_additional_jmxremote_password_file        = $::neo4j::dbms_jvm_additional_jmxremote_password_file
  $dbms_jvm_additional_jmxremote_port                 = $::neo4j::dbms_jvm_additional_jmxremote_port
  $dbms_jvm_additional_jmxremote_ssl                  = $::neo4j::dbms_jvm_additional_jmxremote_ssl
  $dbms_jvm_additional_omit_stacktrace_in_fast_throw  = $::neo4j::dbms_jvm_additional_omit_stacktrace_in_fast_throw
  $dbms_jvm_additional_rmi_server_hostname            = $::neo4j::dbms_jvm_additional_rmi_server_hostname
  $dbms_jvm_additional_trust_final_non_static_fields  = $::neo4j::dbms_jvm_additional_trust_final_non_static_fields
  $dbms_jvm_additional_unlock_experimental_vm_options = $::neo4j::dbms_jvm_additional_unlock_experimental_vm_options
  $dbms_jvm_additional_unsupported_dbms_udc_source    = $::neo4j::dbms_jvm_additional_unsupported_dbms_udc_source
  $dbms_jvm_additional_use_g1gc                       = $::neo4j::dbms_jvm_additional_use_g1gc
  $dbms_memory_heap_initial_size                      = $::neo4j::dbms_memory_heap_initial_size
  $dbms_memory_heap_max_size                          = $::neo4j::dbms_memory_heap_max_size

  file { 'neo4j-wrapper.conf':
    path    => "${config_dir}/neo4j-wrapper.conf",
    content => template('neo4j/configuration/neo4j-wrapper.conf.erb'),
  }

  ###
  ### jmx.access
  ###
  if ( $jmx_enable ) {
    file { 'jmx.access':
      path    => "${config_dir}/jmx.access",
      content => template('neo4j/configuration/jmx.access.erb'),
    }
  }

  ###
  ### jmx.password
  ###
  if ( $jmx_enable ) {
    file { 'jmx.password':
      path    => "${config_dir}/jmx.password",
      content => template('neo4j/configuration/jmx.password.erb'),
    }
  }
}
