# == Class: neo4j
#
# Installs Neo4J (http://www.neo4j.com) on RHEL/Ubuntu/Debian from their
# distribution tarballs downloaded directly from their site.
#
# === Parameters
#
# @param browser_allow_outgoing_connections
# Configure the policy for outgoing Neo4j Browser connections.
# Type: boolean
# Default: true
#
# @param browser_credential_timeout
# Configure the Neo4j Browser to time out logged in users after this idle period.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 0
#
# @param browser_remote_content_hostname_whitelist
# Whitelist of hosts for the Neo4j Browser to be allowed to fetch content from.
# Type: string
# Default: http://guides.neo4j.com,https://guides.neo4j.com,http://localhost,https://localhost
#
# @param browser_retain_connection_credentials
# Configure the Neo4j Browser to store or not store user credentials.
# Type: boolean
# Default: true
#
# @param causal_clustering_array_block_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of ARRAY_BLOCK IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_catchup_batch_size
# Version: 3.1
# The maximum batch size when catching up (in unit of entries).
# Type: integer
# Default: 64
#
# @param causal_clustering_cluster_allow_reads_on_followers
# Version: 3.1
# Configure if the dbms.cluster.routing.getServers() procedure should include
# followers as read endpoints or return only read replicas.
# Type: boolean
# Default: false
#
# @param causal_clustering_cluster_routing_ttl
# Version: 3.1
# How long drivers should cache the data from the
# dbms.cluster.routing.getServers() procedure.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
#       which is minimum 1000
# Default: 300000
#
# @param causal_clustering_cluster_topology_refresh
# Version: 3.1
# Time between scanning the cluster to refresh current server’s view of topology.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
#       which is minimum 1000
# Default: 60000
#
# @param causal_clustering_disable_middleware_logging
# Version: 3.1
# Prevents the network middleware from dumping its own logs.
# Type: boolean
# Default: true
#
# @param causal_clustering_discovery_advertised_address
# Version: 3.1
# Advertised cluster member discovery management communication.
# Type: an advertised socket address
# Default: localhost:5000
#
# @param causal_clustering_discovery_listen_address
# Version: 3.1
# Host and port to bind the cluster member discovery management communication.
# Type: a listen socket address
# Default: localhost:5000
#
# @param causal_clustering_expected_core_cluster_size
# Version: 3.1
# Expected number of Core machines in the cluster.
# Type: integer
# Default: 3
#
# @param causal_clustering_global_session_tracker_state_size
# Version: 3.1
# The maximum file size before the global session tracker state file is rotated
# (in unit of entries).
# Type: integer
# Default: 1000
#
# @param causal_clustering_id_alloc_state_size
# Version: 3.1
# The maximum file size before the ID allocation file is rotated (in unit of
# entries).
# Type: integer
# Default: 1000
#
# @param causal_clustering_initial_discovery_members
# Version: 3.1
# A comma-separated list of other members of the cluster to join.
# Type: list, separated by ",", where items are an advertised socket address
# Mandatory: yes
#
# @param causal_clustering_join_catch_up_timeout
# Version: 3.1
# Time out for a new member to catch up.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 600000
#
# @param causal_clustering_label_token_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of LABEL_TOKEN IDs.
# Type: integer
# Default: 32
#
# @param causal_clustering_label_token_name_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of LABEL_TOKEN_NAME IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_last_applied_state_size
# Version: 3.1
# The maximum file size before the storage file is rotated (in unit of entries).
# Type: integer
# Default: 1000
#
# @param causal_clustering_leader_election_timeout
# Version: 3.1
# The time limit within which a new leader election will occur if no messages
# are received.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 7000
#
# @param causal_clustering_log_shipping_max_lag
# Version: 3.1
# The maximum lag allowed before log shipping pauses (in unit of entries).
# Type: integer
# Default: 256
#
# @param causal_clustering_neostore_block_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of NEOSTORE_BLOCK IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_node_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of NODE IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_node_labels_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of NODE_LABELS IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_outgoing_queue_size
# Version: 3.1
# The number of messages waiting to be sent to other servers in the cluster.
# Type: integer
# Default: 64
#
# @param causal_clustering_property_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of PROPERTY IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_property_key_token_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of PROPERTY_KEY_TOKEN IDs.
# Type: integer
# Default: 32
#
# @param causal_clustering_property_key_token_name_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of PROPERTY_KEY_TOKEN_NAME IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_pull_interval
# Version: 3.1
# Interval of pulling updates from cores.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 1000
#
# @param causal_clustering_raft_advertised_address
# Version: 3.1
# Advertised hostname/IP address and port for the RAFT server.
# Type: an advertised socket address
# Default: localhost:7000
#
# @param causal_clustering_raft_listen_address
# Version: 3.1
# Network interface and port for the RAFT server to listen on.
# Type: a listen socket address
# Default: localhost:7000
#
# @param causal_clustering_raft_log_implementation
# Version: 3.1
# RAFT log implementation.
# Type: string
# Default: SEGMENTED
#
# @param causal_clustering_raft_log_prune_strategy
# Version: 3.1
# RAFT log pruning strategy.
# Type: string
# Default: 1g size
#
# @param causal_clustering_raft_log_pruning_frequency
# Version: 3.1
# RAFT log pruning frequency.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 600000
#
# @param causal_clustering_raft_log_reader_pool_size
# Version: 3.1
# RAFT log reader pool size.
# Type: integer
# Default: 8
#
# @param causal_clustering_raft_log_rotation_size
# Version: 3.1
# RAFT log rotation size.
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
#       which is minimum 1024
# Default: 262144000
#
# @param causal_clustering_raft_membership_state_size
# Version: 3.1
# The maximum file size before the membership state file is rotated (in unit of
# entries).
# Type: integer
# Default: 1000
#
# @param causal_clustering_raft_messages_log_enable
# Version: 3.1
# Enable or disable the dump of all network messages pertaining to the RAFT
# protocol.
# Type: boolean
# Default: false
#
# @param causal_clustering_raft_term_state_size
# Version: 3.1
# The maximum file size before the term state file is rotated (in unit of
# entries).
# Type: integer
# Default: 1000
#
# @param causal_clustering_raft_vote_state_size
# Version: 3.1
# The maximum file size before the vote state file is rotated (in unit of
# entries).
# Type: integer
# Default: 1000
#
# @param causal_clustering_read_replica_refresh_rate
# Version: 3.1
# Read replica 'call home' frequency.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
#       which is minimum 5000
# Default: 5000
#
# @param causal_clustering_read_replica_time_to_live
# Version: 3.1
# Time To Live before read replica is considered unavailable.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
#       which is minimum 60000
# Default: 60000
#
# @param causal_clustering_relationship_group_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of RELATIONSHIP_GROUP IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_relationship_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of RELATIONSHIP IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_relationship_type_token_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of RELATIONSHIP_TYPE_TOKEN IDs.
# Type: integer
# Default: 32
#
# @param causal_clustering_relationship_type_token_name_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of RELATIONSHIP_TYPE_TOKEN_NAME IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_replicated_lock_token_state_size
# Version: 3.1
# The maximum file size before the replicated lock token state file is rotated
# (in unit of entries).
# Type: integer
# Default: 1000
#
# @param causal_clustering_schema_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of SCHEMA IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_state_machine_apply_max_batch_size
# Version: 3.1
# The maximum number of operations to be batched during applications of
# operations in the state machines.
# Type: integer
# Default: 16
#
# @param causal_clustering_state_machine_flush_window_size
# Version: 3.1
# The number of operations to be processed before the state machines flush to
# disk.
# Type: integer
# Default: 4096
#
# @param causal_clustering_string_block_id_allocation_size
# Version: 3.1
# The size of the ID allocation requests Core servers will make when they run
# out of STRING_BLOCK IDs.
# Type: integer
# Default: 1024
#
# @param causal_clustering_transaction_advertised_address
# Version: 3.1
# Advertised hostname/IP address and port for the transaction shipping server.
# Type: an advertised socket address
# Default: localhost:6000
#
# @param causal_clustering_transaction_listen_address
# Version: 3.1
# Network interface and port for the transaction shipping server to listen on.
# Type: a listen socket address
# Default: localhost:6000
#
# @param causal_clustering_unknown_address_logging_throttle
# Version: 3.1
# Throttle limit for logging unknown cluster member address.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 10000
#
# @param cypher_default_language_version
# Set this to specify the default parser (language version).
# Type: one of {2.3, 3.0, 3.1, default}
# Default: default
#
# @param cypher_forbid_exhaustive_shortestpath
# This setting is associated with performance optimization.
# Type: boolean
# Default: false
#
# @param cypher_hints_error
# Set this to specify the behavior when Cypher planner or runtime hints cannot be
# fulfilled.
# Type: boolean
# Default: false
#
# @param cypher_min_replan_interval
# The minimum lifetime of a query plan before a query is considered for
# replanning.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 10000
#
# @param cypher_planner
# Set this to specify the default planner for the default language version.
# Type: one of {COST, RULE, default}
# Default: default
#
# @param cypher_statistics_divergence_threshold
# The threshold when a plan is considered stale.
# Type: double, minimum 0.0, maximum 1.0
# Default: 0.75
#
# @param dbms_active_database
# Name of the database to load.
# Type: string
# Default: graph.db
#
# @param dbms_allow_format_migration
# Whether to allow a store upgrade in case the current version of the database
# starts against an older store version.
# Type: boolean
# Default: false
#
# @param dbms_backup_address
# Listening server for online backups.
# Type: hostname and port
# Default: 127.0.0.1:6362-6372
#
# @param dbms_backup_enabled
# Enable support for running online backups.
# Type: boolean
# Default: true
#
# @param dbms_checkpoint_interval_time
# Configures the time interval between check-points.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 300000
#
# @param dbms_checkpoint_interval_tx
# Configures the transaction interval between check-points.
# Type: integer, minimum 1
# Default: 100000
#
# @param dbms_checkpoint_iops_limit
# Limit the number of IOs the background checkpoint process will consume per
# second.
# Type: integer
# Default: 1000
#
# @param dbms_connector_bolt_advertised_address
# The advertised_address setting specifies the address clients should use for
# this connector. This is useful in a causal cluster as it allows each server
# to correctly advertise addresses of the other servers in the cluster.
#
# @param dbms_connector_bolt_enabled
# The enabled setting allows the client connector to be enabled or disabled.
# When disabled, Neo4j does not listen for incoming connections on the relevant
# port.
# Type: boolean
# Default: true
#
# @param dbms_connector_bolt_listen_address
# The listen_address setting specifies how Neo4j listens for incoming
# connections.
# Type: hostname and port
#
# @param dbms_connector_http_advertised_address
# The advertised_address setting specifies the address clients should use for
# this connector. This is useful in a causal cluster as it allows each server
# to correctly advertise addresses of the other servers in the cluster.
#
# @param dbms_connector_http_enabled
# The enabled setting allows the client connector to be enabled or disabled.
# When disabled, Neo4j does not listen for incoming connections on the relevant
# port.
# Type: boolean
# Default: true
#
# @param dbms_connector_http_listen_address
# The listen_address setting specifies how Neo4j listens for incoming
# connections.
# Type: hostname and port
#
# @param dbms_connector_https_advertised_address
# The advertised_address setting specifies the address clients should use for
# this connector. This is useful in a causal cluster as it allows each server
# to correctly advertise addresses of the other servers in the cluster.
#
# @param dbms_connector_https_enabled
# The enabled setting allows the client connector to be enabled or disabled.
# When disabled, Neo4j does not listen for incoming connections on the relevant
# port.
# Type: boolean
# Default: true
#
# @param dbms_connector_https_listen_address
# The listen_address setting specifies how Neo4j listens for incoming
# connections.
# Type: hostname and port
#
# @param dbms_connectors_default_advertised_address
# Default hostname or IP address the server uses to advertise itself to its
# connectors.
# Version: 3.1
# Type: string
# Default: localhost
#
# @param dbms_connectors_default_listen_address
# Default network interface to listen for incoming connections.
# Version: 3.1
# Type: string
# Default: localhost
#
# @param dbms_directories_certificates
# Directory for storing certificates to be used by Neo4j for TLS connections.
# Type: filesystem path; relative paths are resolved agains the installation root, <neo4j-home>
# Default: certificates
#
# @param dbms_directories_data
# Path of the data directory.
# Type: filesystem path; relative paths are resolved agains the installation root, <neo4j-home>
# Default: data
#
# @param dbms_directories_import
# Sets the root directory for file URLs used with the Cypher LOAD CSV clause.
# Type: filesystem path; relative paths are resolved agains the installation root, <neo4j-home>
#
# @param dbms_directories_lib
# Path of the lib directory.
# Type: filesystem path; relative paths are resolved agains the installation root, <neo4j-home>
# Default: lib
#
# @param dbms_directories_logs
# Path of the logs directory.
# Type: filesystem path; relative paths are resolved agains the installation root, <neo4j-home>
# Default: logs
#
# @param dbms_directories_metrics
# The target location of the CSV files: a path to a directory wherein a CSV file
# per reported field will be written.
# Type: filesystem path; relative paths are resolved agains the installation root, <neo4j-home>
# Default: metrics
#
# @param dbms_directories_plugins
# Location of the database plugin directory.
# Type: filesystem path; relative paths are resolved agains the installation root, <neo4j-home>
# Default: plugins
#
# @param dbms_directories_run
# Path of the run directory.
# Type: filesystem path; relative paths are resolved agains the installation root, <neo4j-home>
# Default: run
#
# @param dbms_memory_heap_initial_size
# Initial size of the heap
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
# Default: '512m'
#
# @param dbms_memory_heap_max_size
# Upper boundary of memory heap
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
# Default: '512m'
#
# @param dbms_ids_reuse_types_override
# Version: 3.1
# Specified names of id types (comma separated) that should be reused.
# Type: list separated by "," where items are one of {NODE, RELATIONSHIP}
# Default: [RELATIONSHIP, NODE]
#
# @param dbms_index_sampling_background_enabled
# Enable or disable background index sampling.
# Type: boolean
# Default: true
#
# @param dbms_index_sampling_buffer_size
# Size of buffer used by index sampling
# Depracated: since 3.0.3. Use dbms.index_sampling.sample_size_limit instead.
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
#       which is minimum 1048576, maximum 2147483647
# Default: 67108864
#
# @param dbms_index_sampling_sample_size_limit
# Index sampling chunk size limit.
# Type: integer, minimum 1048576, maximum 2147483647
# Default: 8388608
#
# @param dbms_index_sampling_update_percentage
# Percentage of index updates of total index size required before sampling of a
# given index is triggered.
# Type: integer, minimum 0
# Default: 5
#
# @param dbms_jvm_additional_commit_memory_to_process
# Make sure that `initmemory` is not only allocated but committed to
# the process, before starting the database.
# Type: string
# Default: '-XX:+AlwaysPreTouch'
#
# @param dbms_jvm_additional_disable_explicit_gc
# Disable explicit garbage collection.
# Type: string
# Default: '-XX:+DisableExplicitGC'
#
# @param dbms_jvm_additional_ephemeral_dh_keysize
# Expand Diffie Helman (DH) key size form default 1024 to 2048 for DH-RSA cipher
# suites used in serverl TLS handshakes.
# Type: string
# Default: '-Djdk.tls.ephemeralDHKeySize=2048'
#
# @param dbms_jvm_additional_hashcode
# Reduce probability of objects getting the same identity hash code via a race,
# by computing them with thread-local PRNGs.
# Default: '-XX:hashCode=5'
#
# @param dbms_index_searcher_cache_size
# The maximum number of open Lucene index searchers.
# Type: integer, minimum 1
# Default: 2147483647
#
# @param dbms_jvm_additional_jmxremote_access_file
# This settings is used for exposing the JMX.
# Type: string
# Default: 'jmx.access'
#
# @param dbms_jvm_additional_jmxremote_authenticate
# This settings is used for exposing the JMX.
# Type: boolean
# Default: true
#
# @param dbms_jvm_additional_jmxremote_password_file
# This settings is used for exposing the JMX.
# Type: boolean
# Default: 'jmx.password'
#
# @param dbms_jvm_additional_jmxremote_port
# This settings is used for exposing the JMX.
# Type: integer
# Default: 3637
#
# @param dbms_jvm_additional_jmxremote_ssl
# This settings is used for exposing the JMX.
# Type: boolean
# Default: false
#
# @param dbms_jvm_additional_omit_stacktrace_in_fast_throw
# Have common exceptions keep producing stack traces, so they can be debugged
# regardless of how often logs are rotated.
# Type: string
# Default: '-XX:OmitStackTraceInFastThrow'
#
# @param dbms_jvm_additional_rmi_server_hostname
# Some systems cannot discover host name automatically, and need rmi server
# hostname explicitly stated.
# Type: string
# Default: '-Djava.rmi.server.hostname='
#
# @param dbms_jvm_additional_ssl_keystore
# For using self-signed certificate in a test environment
# Type: string
# Default: 'MyCert.jks'
#
# @param dbms_jvm_additional_ssl_keystore_password
# For using self-signed certificate in a test environment
# Type: string
# Default: 'secret'
#
# @param dbms_jvm_additional_ssl_truststore
# For using self-signed certificate in a test environment
# Type: string
# Default: 'MyCert.jks'
#
# @param dbms_jvm_additional_ssl_truststore_password
# For using self-signed certificate in a test environment
# Type: string
# Default: 'secret'
#
# @param dbms_jvm_additional_trust_final_non_static_fields
# Trust that non-static final fields are really final.
# Type: string
# Default: '-XX:+TrustFinalNonStaticFields'
#
# @param dbms_jvm_additional_unlock_experimental_vm_options
# Allows for more optimisations and improves overall performance. Not to be
# used in embedded mode.
# Type: string
# Default: '-XX:+UnlockExperimentalVMOptions'
#
# @param dbms_jvm_additional_unsupported_dbms_udc_source
# ??
# Type: string
# Default: 'tarball'
#
# @param dbms_jvm_additional_use_g1gc
# G1GC generally strikes a good balance between throughput and tail latency,
# without too much tuning.
# Type: string
# Default: '-XX:+UseG1GC'
#
# @param dbms_logs_debug_level
# Debug log level threshold.
# Type: one of DEBUG, INFO, WARN, ERROR, NONE
# Default: INFO
#
# @param dbms_logs_debug_rotation_delay
# Minimum time interval after last rotation of the debug log before it may be
# rotated again.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 300000
#
# @param dbms_logs_debug_rotation_keep_number
# Maximum number of history files for the debug log.
# Type: integer, minimum 1
# Default: 7
#
# @param dbms_logs_debug_rotation_size
# Threshold for rotation of the debug log.
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
#       which is minimum 0, maximum 9223372036854775807
# Default: 20971520
#
# @param dbms_logs_gc_enabled
# Enable GC Logging.
# Type: boolean
# Default: false
#
# @param dbms_logs_gc_options
# GC Logging Options.
# Type: list
# Default: ['-XX:+PrintGCDetails', '-XX:+PrintGCDateStamps', \
#          '-XX:+PrintGCApplicationStoppedTime', '-XX:+PrintPromotionFailure', \
#          '-XX:+PrintTenuringDistribution']
#
# @param dbms_logs_gc_rotation_keep_number
# Number of GC logs to keep.
# Type: integer
# Default: 5
#
# @param dbms_logs_gc_rotation_size
# Size of each GC log that is kept.
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
#       which is minimum 0, maximum 9223372036854775807
# Default: 20971520
#
# @param dbms_logs_http_enabled
# Enable HTTP request logging.
# Type: boolean
# Default: false
#
# @param dbms_logs_http_rotation_keep_number
# Number of HTTP logs to keep.
# Type: integer
# Default: 5
#
# @param dbms_logs_http_rotation_size
# Size of each HTTP log that is kept.
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
#       which is minimum 0, maximum 9223372036854775807
# Default: 20971520
#
# @param dbms_logs_query_enabled
# Log executed queries that take longer than the configured threshold,
# dbms.logs.query.threshold.
# Type: boolean
# Default: false
#
# @param dbms_logs_query_parameter_logging_enabled
# Log parameters for executed queries that took longer than the configured
# threshold.
# Type: boolean
# Default: true
#
# @param dbms_logs_query_rotation_keep_number
# Maximum number of history files for the query log.
# Type: integer, minimum 1
# Default: 7
#
# @param dbms_logs_query_rotation_size
# The file size in bytes at which the query log will auto-rotate.
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
#       which is minimum 0, maximum 9223372036854775807
# Default: 20971520
#
# @param dbms_logs_query_threshold
# If the execution of query takes more time than this threshold, the query is
# logged - provided query logging is enabled.
# Setting this param to 0 will result in all queries being logged.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 0
#
# @param dbms_logs_security_level
# Version: 3.1
# Security log level threshold.
# Type: one of DEBUG, INFO, WARN, ERROR, NONE
# Default: INFO
#
# @param dbms_logs_security_rotation_delay
# Version: 3.1
# Minimum time interval after last rotation of the security log before it may be
# rotated again.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: '300s'
#
# @param dbms_logs_security_rotation_keep_number
# Version: 3.1
# Maximum number of history files for the security log.
# Type: integer
# Default: 7
#
# @param dbms_logs_security_rotation_size
# Version: 3.1
# Threshold for rotation of the security log.
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
#       which is minimum 0, maximum 9223372036854775807
# Default: 20971520
#
# @param dbms_memory_pagecache_size
# The amount of memory to use for mapping the store files, in bytes (or
# kilobytes with the 'k' suffix, megabytes with 'm' and gigabytes with 'g').
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
#       which is minimum 245760
#
# @param dbms_memory_pagecache_swapper
# Specify which page swapper to use for doing paged IO.
# Type: string
#
# @param dbms_mode
# Configure the operating mode of the database — 
#   'SINGLE' for stand-alone operation,
#   'HA' for operating as a member in a cluster,
#   'ARBITER' for an HA-only cluster member with no database,
#   'CORE' for a core member of a Causal Clustering cluster, (3.1)
#   or 'READ_REPLICA' for read replica. (3.1)
# Type: string
# Default: SINGLE
#
# @param dbms_query_cache_size
# The number of Cypher query execution plans that are cached.
# Type: integer, minimum 0
# Default: 1000
#
# @param dbms_read_only
# Only allow read operations from this Neo4j instance.
# Type: boolean
# Default: false
#
# @param dbms_record_format
# Database record format.
# Type: string (valid values are {'standard', 'high_limit'})
# Default: 'standard'
#
# @param dbms_relationship_grouping_threshold
# Relationship count threshold for considering a node to be dense.
# Type: integer, minimum 1
# Default: 50
#
# @param dbms_rest_transaction_idle_timeout
# Timeout for idle transactions in the REST endpoint.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 60000
#
# @param dbms_security_allow_csv_import_from_file_urls
# Determines if Cypher will allow using file URLs when loading data using
# LOAD CSV.
# Type: boolean
# Default: true
#
# @param dbms_security_allow_publisher_create_token
# Version: 3.1
# Set to true if users with role publisher are allowed to create new tokens.
# Type: boolean
# Default: false
#
# @param dbms_security_auth_cache_max_capacity
# Version: 3.1
# The maximum capacity for authentication and authorization caches
# (respectively).
# Type: integer
# Default: 10000
#
# @param dbms_security_auth_cache_ttl
# Version: 3.1
# The time to live (TTL) for cached authentication and authorization info when
# using external auth providers (LDAP or plugin).
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 60000
#
# @param dbms_security_auth_enabled
# Enable auth requirement to access Neo4j.
# Type: boolean
# Default: false
#
# @param dbms_security_auth_provider
# Version: 3.1
# The authentication and authorization provider that contains both the users and
# roles. Possible values 'native', 'ldap'.
# Type: string
# Default: native
#
# @param dbms_security_ha_status_auth_enabled
# Require authorization for access to the HA status endpoints.
# Type: boolean
# Default: true
#
# @param dbms_security_http_authorization_classes
# Comma-seperated list of custom security rules for Neo4j to use.
# Type: list separated by "," where items are a string
# Default: []
#
# @param dbms_security_ldap_authentication_cache_enabled
# Version: 3.1
# Determines if the result of authentication via the LDAP server should be
# cached or not.
# Type: boolean
# Default: true
#
# @param dbms_security_ldap_authentication_mechanism
# Version: 3.1
# LDAP authentication mechanism.
# Type: string (valid values are {'simple', 'DIGEST-MD5'})
# Default: 'simple'
#
# @param dbms_security_ldap_authentication_user_dn_template
# Version: 3.1
# LDAP user DN template.
# Type: string
# Default: uid={0},ou=users,dc=example,dc=com
#
# @param dbms_security_ldap_authorization_group_membership_attributes
# Version: 3.1
# A list of attribute names on a user object that contains groups to be used for
# mapping to roles when LDAP authorization is enabled.
# Type: list separated by "," where items are a string
# Default: [memberOf]
#
# @param dbms_security_ldap_authorization_group_to_role_mapping
# Version: 3.1
# An authorization mapping from LDAP group names to Neo4j role names.
# Type: string
#
# @param dbms_security_ldap_authorization_system_password
# Version: 3.1
# An LDAP system account password to use for authorization searches when
# dbms.security.ldap.authorization.use_system_account is true.
# Type: string
#
# @param dbms_security_ldap_authorization_system_username
# Version: 3.1
# An LDAP system account username to use for authorization searches when
# dbms.security.ldap.authorization.use_system_account is true.
# Type: string
#
# @param dbms_security_ldap_authorization_use_system_account
# Version: 3.1
# Perform LDAP search for authorization info using a system account instead of
# the user’s own account.
# If this is set to false (default), the search for group membership will be
# performed directly after authentication using the LDAP context bound with the
# user’s own account.
# Type: boolean
# Default: false
#
# @param dbms_security_ldap_authorization_user_search_base
# Version: 3.1
# The name of the base object or named context to search for user objects when
# LDAP authorization is enabled.
# Type: string
# Default: ou=users,dc=example,dc=com
#
# @param dbms_security_ldap_authorization_user_search_filter
# Version: 3.1
# The LDAP search filter to search for a user principal when LDAP authorization
# is enabled.
# Type: string
# Default: (&(objectClass=*)(uid={0}))
#
# @param dbms_security_ldap_connection_timeout
# Version: 3.1
# The timeout for establishing an LDAP connection.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 30000
#
# @param dbms_security_ldap_host
# Version: 3.1
# URL of LDAP server to use for authentication and authorization.
# Type: string
# Default: localhost
#
# @param dbms_security_ldap_read_timeout
# Version: 3.1
# The timeout for an LDAP read request (i.e. search). A value of 0 means wait
# for a response indefinitely.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 30000
#
# @param dbms_security_ldap_referral
# Version: 3.1
# The LDAP referral behavior when creating a connection.
# Type: string
# Default: follow
#
# @param dbms_security_ldap_use_starttls
# Version: 3.1
# Use secure communication with the LDAP server using opportunistic TLS.
# Type: boolean
# Default: false
#
# @param dbms_security_log_successful_authentication
# Version: 3.1
# Set to log successful authentication events to the security log.
# Type: boolean
# Default: true
#
# @param dbms_security_procedures_default_allowed
# Version: 3.1
# The default role that can execute all procedures and user-defined functions
# that are not covered by the dbms.security.procedures.roles setting.
# Type: string
# Default: ''
#
# @param dbms_security_procedures_roles
# Version: 3.1
# This provides a finer level of control over which roles can execute procedures
# than the dbms.security.procedures.default_allowed setting.
# Type: string
# Default: ''
#
# @param dbms_shell_enabled
# Enable a remote shell server which Neo4j Shell clients can log in to.
# Type: boolean
# Default: false
#
# @param dbms_shell_host
# Remote host for shell.
# Type: string, must be a valid name.
# Default: 127.0.0.1
#
# @param dbms_shell_port
# The port the shell will listen on.
# Type: integer which must be a valid port number - range 0 to 65535
# Default: 1337
#
# @param dbms_shell_read_only
# Read only mode.
# Type: boolean
# Default: false
#
# @param dbms_shell_rmi_name
# The name of the shell.
# Type: string
# Default: shell
#
# @param dbms_threads_worker_count
# Number of Neo4j worker threads, your OS might enforce a lower limit than the
# maximum value specified here.
# Type: integer, range 1 to 44738.
# Default: The minimum between "number of processors" and 500
#
# @param dbms_transaction_timeout
# The maximum time interval of a transaction within which it should be completed.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 0
#
# @param dbms_tx_log_rotation_retention_policy
# Make Neo4j keep the logical transaction logs for being able to backup the database.
# Type: string, must be true/false or of format '<number><optional unit><type>
# Default: 7 days
#
# @param dbms_tx_log_rotation_size
# Specifies at which file size the logical log will auto-rotate.
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
#       which is minimum 1048576
# Default: 262144000
#
# @param dbms_udc_enabled
# Enable the UDC extension.
# Type: boolean
# Default: true
#
# @param dbms_unmanaged_extension_classes
# Comma-separated list of <classname>=<mount point> for unmanaged extensions.
# Type: list
# Default: []
#
# @param default_file
# File containing environment variables
# Type: filesystem path; relative paths are resolved agains the installation root, <neo4j-home>
# Default: dependent on osfamily fact. RedHat:'/etc/sysconfig/neo4j', Debian:'/etc/default/neo4j'
#
# @param edition
# Pick edition of neo4j
# Type: string ( value in {'community', 'enterprise'} )
# Default: 'community'
#
# @param group
# The group the neo4j user belongs to
# Type: string
# Default: 'neo4j'
#
# @param ha_allow_init_cluster
# Whether to allow this instance to create a cluster if unable to join.
# Type: boolean
# Default: true
#
# @param ha_branched_data_copying_strategy
# Strategy for how to order handling of branched data on slaves and copying of
# the store from the master.
# Type: one of branch_then_copy, copy_then_branch
# Default: branch_then_copy
#
# @param ha_branched_data_policy
# Policy for how to handle branched data.
# Type: one of keep_all, keep_last, keep_none
# Default: keep_all
#
# @param ha_broadcast_timeout
# Timeout for broadcasting values in cluster.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 30000
#
# @param ha_configuration_timeout
# Timeout for waiting for configuration from an existing cluster member during
# cluster join.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 1000
#
# @param ha_data_chunk_size
# Max size of the data chunks that flows between master and slaves in HA.
# Type: byte size (valid multipliers are 'k', 'm', 'g', 'K', 'M', 'G')
#       which is minimum 1024
# Default: 2097152
#
# @param ha_default_timeout
# Default timeout used for clustering timeouts.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 5000
#
# @param ha_election_timeout
# Timeout for waiting for other members to finish a role election.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 5000
#
# @param ha_heartbeat_interval
# How often heartbeat messages should be sent.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 5000
#
# @param ha_heartbeat_timeout
# How long to wait for heartbeats from other instances before marking them as
# suspects for failure.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 40000
#
# @param ha_host_coordination
# Host and port to bind the cluster management communication.
# Type: hostname and port
# Default: 0.0.0.0:5001-5099
#
# @param ha_host_data
# Hostname and port to bind the HA server.
# Type: hostname and port
# Default: 0.0.0.0:6001-6011
#
# @param ha_initial_hosts
# A comma-separated list of other members of the cluster to join.
# Type: list separated by ",", where items are a hostname and port
# Mandatory: yes
#
# @param ha_internal_role_switch_timeout
# Timeout for waiting for internal conditions during state switch, like for
# transactions to complete, before switching to master or slave.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 10000
#
# @param ha_join_timeout
# Timeout for joining a cluster.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 30000
#
# @param ha_learn_timeout
# Timeout for learning values.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 5000
#
# @param ha_leave_timeout
# Timeout for waiting for cluster leave to finish.
# Type: integer
# Default: 30000
#
# @param ha_max_acceptors
# Maximum number of servers to involve when agreeing to membership changes.
# Type: integer, minimum 1
# Default: 21
#
# @param ha_max_channels_per_slave
# Maximum number of connections a slave can have to the master.
# Type: integer, minimum 1
# Default: 20
#
# @param ha_paxos_timeout
# Default value for all Paxos timeouts.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 5000
#
# @param ha_phase1_timeout
# Timeout for Paxos phase 1.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 5000
#
# @param ha_phase2_timeout
# Timeout for Paxos phase 2.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 5000
#
# @param ha_pull_batch_size
# Size of batches of transactions applied on slaves when pulling from master.
# Type: integer
# Default: 100
#
# @param ha_pull_interval
# Interval of pulling updates from master.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 0
#
# @param ha_role_switch_timeout
# Timeout for request threads waiting for instance to become master or slave.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 120000
#
# @param ha_server_id
# Id for a cluster instance.
# Type: instance id, which has to be a valid integer
# Mandatory: yes
#
# @param ha_slave_lock_timeout
# Timeout for taking remote (write) locks on slaves.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 20000
#
# @param ha_slave_only
# Whether this instance should only participate as slave in cluster.
# Type: boolean
# Default: false
#
# @param ha_slave_read_timeout
# How long a slave will wait for response from master before giving up.
# Type: integer, minimum 0
# Default: 20000
#
# @param ha_tx_push_factor
# The amount of slaves the master will ask to replicate a committed transaction.
# Type: integer, minimum 0
# Default: 1
#
# @param ha_tx_push_strategy
# Push strategy of a transaction to a slave during commit.
# Type: string. One of 'round_robin', 'fixed_descending', 'fixed_ascending'
# Default: 'fixed_ascending'
#
# @param install_method
# Choice between 'package' and 'source'
# Type: string
# Default: 'package'
#
# @param install_prefix
# Determines the NEO4J_HOME.
# Type: filesystem path; must be absolute path.
# Default: '/usr/share'
#
# @param jmx_enable
# Enable remote JMX monitoring
# Type: boolean
# Default: false
#
# @param manage_repo
# Add neo4j repository as custom repository.
# Type: boolean
# Default: false
#
# @param metrics_bolt_messages_enabled
# Enable reporting metrics about Bolt Protocol message processing.
# Type: boolean
# Default: false
#
# @param metrics_csv_enabled
# Set to true to enable exporting metrics to CSV files.
# Type: boolean
# Default: false
#
# @param metrics_csv_interval
# The reporting interval for the CSV files.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 3000
#
# @param metrics_csv_path
# Directory path for csv output files.
# Type: filesystem path; relative paths are resolved agains the installation root, <neo4j-home>
# Default: 'metrics'
#
# @param metrics_cypher_replanning_enabled
# Enable reporting metrics about number of occurred replanning events.
# Type: boolean
# Default: false
#
# @param metrics_enabled
# The default enablement value for all the supported metrics.
# Type: boolean
# Default: false
#
# @param metrics_graphite_enabled
# Set to true to enable exporting metrics to Graphite.
# Type: boolean
# Default: false
#
# @param metrics_graphite_interval
# The reporting interval for Graphite.
# Type: duration (valid units are {'ms', 's', 'm'}; default unit is 's'.)
# Default: 3000
#
# @param metrics_graphite_server
# The hostname or IP address of the Graphite server.
# Type: hostname and port
# Default: localhost:2003
#
# @param metrics_jvm_buffers_enabled
# Enable reporting metrics about the buffer pools.
# Type: boolean
# Default: false
#
# @param metrics_jvm_gc_enabled
# Enable reporting metrics about the duration of garbage collections.
# Type: boolean
# Default: false
#
# @param metrics_jvm_memory_enabled
# Enable reporting metrics about the memory usage.
# Type: boolean
# Default: false
#
# @param metrics_jvm_threads_enabled
# Enable reporting metrics about the current number of threads running.
# Type: boolean
# Default: false
#
# @param metrics_neo4j_causal_clustering_enabled
# Version: 3.1
# Enable reporting metrics about Causal Clustering mode.
# Type: boolean
# Default: false
#
# @param metrics_neo4j_checkpointing_enabled
# Enable reporting metrics about Neo4j check pointing.
# Type: boolean
# Default: false
#
# @param metrics_neo4j_cluster_enabled
# Enable reporting metrics about HA cluster info.
# Type: boolean
# Default: false
#
# @param metrics_neo4j_counts_enabled
# Enable reporting metrics about approximately how many entities are in the
# database.
# Type: boolean
# Default: false
#
# @param metrics_neo4j_enabled
# The default enablement value for all Neo4j specific support metrics.
# Type: boolean
# Default: false
#
# @param metrics_neo4j_logrotation_enabled
# Enable reporting metrics about the Neo4j log rotation.
# Type: boolean
# Default: false
#
# @param metrics_neo4j_network_enabled
# Enable reporting metrics about the network usage.
# Type: boolean
# Default: false
#
# @param metrics_neo4j_pagecache_enabled
# Enable reporting metrics about the Neo4j page cache.
# Type: boolean
# Default: false
#
# @param metrics_neo4j_server_enabled
# Enable reporting metrics about Server threading info.
# Type: boolean
# Default: false
#
# @param metrics_neo4j_tx_enabled
# Enable reporting metrics about transactions.
# Type: boolean
# Default: false
#
# @param metrics_prefix
# A common prefix for the reported metrics field names.
# Type: string
# Default: neo4j
#
# @param service_enable
# Manage neo4j service.
# Type: boolean
# Default: true
#
# @param service_ensure
# Whether the service should be running.
# Type: string. Possible values 'stopped' (false), 'running' (true).
# Default: 'running'
#
# @param service_name
# The name of the service to run.
# Type: string
# Default: 'neo4j'
#
# @param service_ulimit
# Maximum number of open file descriptors.
# Type: integer
# Default: 40000
#
# @param service_shutdown_timeout
# Number of seconds to wait for shutdown before killing the process.
# Type: integer
# Default: 120
#
# @param tools_consistency_checker_check_graph
# Perform checks between nodes, relationships, properties, types and tokens_
# Type: boolean
# Default: true
#
# @param tools_consistency_checker_check_indexes
# Perform checks on indexes.
# Type: boolean
# Default: true
#
# @param tools_consistency_checker_check_label_scan_store
# Perform checks on the label scan store.
# Type: boolean
# Default: true
#
# @param tools_consistency_checker_check_property_owners
# Perform optional additional checking on property ownership.
# Type: boolean
# Default: false
#
# @param unsupported_dbms_security_ldap_authorization_connection_pooling
# Set to true if connection pooling should be used for authorization searches
# using the system account.
# Type: boolean
# Default: true
#
# @param user
# The user which runs the neo4j service.
# Type: string
# Default: 'neo4j'
#
# @param version
# The version of the neo4 package.
# Type: string
# Default: 'present'
#
# === Examples
#
#  class { 'neo4j' :
#    version => '3.0.4',
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
# Copyright 2016-2017 Marc Lambrichs, unless otherwise noted.
#
class neo4j (
  $edition                                                           = $::neo4j::params::edition,
  $group                                                             = $::neo4j::params::group,
  $install_prefix                                                    = $::neo4j::params::install_prefix,
  $install_method                                                    = $::neo4j::params::install_method,
  $jmx_enable                                                        = $::neo4j::params::jmx_enable,
  $manage_repo                                                       = $::neo4j::params::manage_repo,
  $service_enable                                                    = $::neo4j::params::service_enable,
  $service_ensure                                                    = $::neo4j::params::service_ensure,
  $service_name                                                      = $::neo4j::params::service_name,
  $user                                                              = $::neo4j::params::user,
  $version                                                           = $::neo4j::params::version,

  ### config default settings
  $default_file                                                      = $::neo4j::params::default_file,
  $service_shutdown_timeout                                          = $::neo4j::params::service_shutdown_timeout,
  $service_ulimit                                                    = $::neo4j::params::service_ulimit,

  ### config general variables
  $dbms_active_database                                              = $::neo4j::params::dbms_active_database,
  $dbms_allow_format_migration                                       = $::neo4j::params::dbms_allow_format_migration,
  $dbms_checkpoint_interval_time                                     = $::neo4j::params::dbms_checkpoint_interval_time,
  $dbms_checkpoint_interval_tx                                       = $::neo4j::params::dbms_checkpoint_interval_tx,
  $dbms_checkpoint_iops_limit                                        = $::neo4j::params::dbms_checkpoint_iops_limit,
  $dbms_directories_certificates                                     = $::neo4j::params::dbms_directories_certificates,
  $dbms_directories_data                                             = $::neo4j::params::dbms_directories_data,
  $dbms_directories_import                                           = $::neo4j::params::dbms_directories_import,
  $dbms_directories_lib                                              = $::neo4j::params::dbms_directories_lib,
  $dbms_directories_logs                                             = $::neo4j::params::dbms_directories_logs,
  $dbms_directories_metrics                                          = $::neo4j::params::dbms_directories_metrics,
  $dbms_directories_plugins                                          = $::neo4j::params::dbms_directories_plugins,
  $dbms_directories_run                                              = $::neo4j::params::dbms_directories_run,
  $dbms_ids_reuse_types_override                                     = $::neo4j::params::dbms_ids_reuse_types_override,
  $dbms_index_sampling_background_enabled                            = $::neo4j::params::dbms_index_sampling_background_enabled,
  $dbms_index_sampling_buffer_size                                   = $::neo4j::params::dbms_index_sampling_buffer_size,
  $dbms_index_sampling_sample_size_limit                             = $::neo4j::params::dbms_index_sampling_sample_size_limit,
  $dbms_index_sampling_update_percentage                             = $::neo4j::params::dbms_index_sampling_update_percentage,
  $dbms_index_searcher_cache_size                                    = $::neo4j::params::dbms_index_searcher_cache_size,
  $dbms_logs_debug_level                                             = $::neo4j::params::dbms_logs_debug_level,
  $dbms_logs_debug_rotation_delay                                    = $::neo4j::params::dbms_logs_debug_rotation_delay,
  $dbms_logs_debug_rotation_keep_number                              = $::neo4j::params::dbms_logs_debug_rotation_keep_number,
  $dbms_logs_debug_rotation_size                                     = $::neo4j::params::dbms_logs_debug_rotation_size,
  $dbms_logs_gc_enabled                                              = $::neo4j::params::dbms_logs_gc_enabled,
  $dbms_logs_gc_options                                              = $::neo4j::params::dbms_logs_gc_options,
  $dbms_logs_gc_rotation_keep_number                                 = $::neo4j::params::dbms_logs_gc_rotation_keep_number,
  $dbms_logs_gc_rotation_size                                        = $::neo4j::params::dbms_logs_gc_rotation_size,
  $dbms_logs_http_enabled                                            = $::neo4j::params::dbms_logs_http_enabled,
  $dbms_logs_http_rotation_keep_number                               = $::neo4j::params::dbms_logs_http_rotation_keep_number,
  $dbms_logs_http_rotation_size                                      = $::neo4j::params::dbms_logs_http_rotation_size,
  $dbms_logs_security_level                                          = $::neo4j::params::dbms_logs_security_level,
  $dbms_memory_pagecache_size                                        = $::neo4j::params::dbms_memory_pagecache_size,
  $dbms_memory_pagecache_swapper                                     = $::neo4j::params::dbms_memory_pagecache_swapper,
  $dbms_mode                                                         = $::neo4j::params::dbms_mode,
  $dbms_read_only                                                    = $::neo4j::params::dbms_read_only,
  $dbms_record_format                                                = $::neo4j::params::dbms_record_format,
  $dbms_relationship_grouping_threshold                              = $::neo4j::params::dbms_relationship_grouping_threshold,
  $dbms_rest_transaction_idle_timeout                                = $::neo4j::params::dbms_rest_transaction_idle_timeout,
  $dbms_shell_enabled                                                = $::neo4j::params::dbms_shell_enabled,
  $dbms_shell_host                                                   = $::neo4j::params::dbms_shell_host,
  $dbms_shell_port                                                   = $::neo4j::params::dbms_shell_port,
  $dbms_shell_read_only                                              = $::neo4j::params::dbms_shell_read_only,
  $dbms_shell_rmi_name                                               = $::neo4j::params::dbms_shell_rmi_name,
  $dbms_security_allow_publisher_create_token                        = $::neo4j::params::dbms_security_allow_publisher_create_token,
  $dbms_tx_log_rotation_retention_policy                             = $::neo4j::params::dbms_tx_log_rotation_retention_policy,
  $dbms_tx_log_rotation_size                                         = $::neo4j::params::dbms_tx_log_rotation_size,
  $dbms_udc_enabled                                                  = $::neo4j::params::dbms_udc_enabled,
  $dbms_unmanaged_extension_classes                                  = $::neo4j::params::dbms_unmanaged_extension_classes,
  $tools_consistency_checker_check_graph                             = $::neo4j::params::tools_consistency_checker_check_graph,
  $tools_consistency_checker_check_indexes                           = $::neo4j::params::tools_consistency_checker_check_indexes,
  $tools_consistency_checker_check_label_scan_store                  = $::neo4j::params::tools_consistency_checker_check_label_scan_store,
  $tools_consistency_checker_check_property_owners                   = $::neo4j::params::tools_consistency_checker_check_property_owners,

  ### config backup variables
  $dbms_backup_address                                               = $::neo4j::params::dbms_backup_address,
  $dbms_backup_enabled                                               = $::neo4j::params::dbms_backup_enabled,

  ### config browser variables
  $browser_allow_outgoing_connections                                = $::neo4j::params::browser_allow_outgoing_connections,
  $browser_credential_timeout                                        = $::neo4j::params::browser_credential_timeout,
  $browser_remote_content_hostname_whitelist                         = $::neo4j::params::browser_remote_content_hostname_whitelist,
  $browser_retain_connection_credentials                             = $::neo4j::params::browser_retain_connection_credentials,

  ### config clustering causal variables
  $causal_clustering_array_block_id_allocation_size                  = $::neo4j::params::causal_clustering_array_block_id_allocation_size,
  $causal_clustering_catchup_batch_size                              = $::neo4j::params::causal_clustering_catchup_batch_size,
  $causal_clustering_cluster_allow_reads_on_followers                = $::neo4j::params::causal_clustering_cluster_allow_reads_on_followers,
  $causal_clustering_cluster_routing_ttl                             = $::neo4j::params::causal_clustering_cluster_routing_ttl,
  $causal_clustering_cluster_topology_refresh                        = $::neo4j::params::causal_clustering_cluster_topology_refresh,
  $causal_clustering_disable_middleware_logging                      = $::neo4j::params::causal_clustering_disable_middleware_logging,
  $causal_clustering_discovery_advertised_address                    = $::neo4j::params::causal_clustering_discovery_advertised_address,
  $causal_clustering_discovery_listen_address                        = $::neo4j::params::causal_clustering_discovery_listen_address,
  $causal_clustering_expected_core_cluster_size                      = $::neo4j::params::causal_clustering_expected_core_cluster_size,
  $causal_clustering_global_session_tracker_state_size               = $::neo4j::params::causal_clustering_global_session_tracker_state_size,
  $causal_clustering_id_alloc_state_size                             = $::neo4j::params::causal_clustering_id_alloc_state_size,
  $causal_clustering_initial_discovery_members                       = $::neo4j::params::causal_clustering_initial_discovery_members,
  $causal_clustering_join_catch_up_timeout                           = $::neo4j::params::causal_clustering_join_catch_up_timeout,
  $causal_clustering_label_token_id_allocation_size                  = $::neo4j::params::causal_clustering_label_token_id_allocation_size,
  $causal_clustering_label_token_name_id_allocation_size             = $::neo4j::params::causal_clustering_label_token_name_id_allocation_size,
  $causal_clustering_last_applied_state_size                         = $::neo4j::params::causal_clustering_last_applied_state_size,
  $causal_clustering_leader_election_timeout                         = $::neo4j::params::causal_clustering_leader_election_timeout,
  $causal_clustering_log_shipping_max_lag                            = $::neo4j::params::causal_clustering_log_shipping_max_lag,
  $causal_clustering_neostore_block_id_allocation_size               = $::neo4j::params::causal_clustering_neostore_block_id_allocation_size,
  $causal_clustering_node_id_allocation_size                         = $::neo4j::params::causal_clustering_node_id_allocation_size,
  $causal_clustering_node_labels_id_allocation_size                  = $::neo4j::params::causal_clustering_node_labels_id_allocation_size,
  $causal_clustering_outgoing_queue_size                             = $::neo4j::params::causal_clustering_outgoing_queue_size,
  $causal_clustering_property_id_allocation_size                     = $::neo4j::params::causal_clustering_property_id_allocation_size,
  $causal_clustering_property_key_token_id_allocation_size           = $::neo4j::params::causal_clustering_property_key_token_id_allocation_size,
  $causal_clustering_property_key_token_name_id_allocation_size      = $::neo4j::params::causal_clustering_property_key_token_name_id_allocation_size,
  $causal_clustering_pull_interval                                   = $::neo4j::params::causal_clustering_pull_interval,
  $causal_clustering_raft_advertised_address                         = $::neo4j::params::causal_clustering_raft_advertised_address,
  $causal_clustering_raft_listen_address                             = $::neo4j::params::causal_clustering_raft_listen_address,
  $causal_clustering_raft_log_implementation                         = $::neo4j::params::causal_clustering_raft_log_implementation,
  $causal_clustering_raft_log_prune_strategy                         = $::neo4j::params::causal_clustering_raft_log_prune_strategy,
  $causal_clustering_raft_log_pruning_frequency                      = $::neo4j::params::causal_clustering_raft_log_pruning_frequency,
  $causal_clustering_raft_log_reader_pool_size                       = $::neo4j::params::causal_clustering_raft_log_reader_pool_size,
  $causal_clustering_raft_log_rotation_size                          = $::neo4j::params::causal_clustering_raft_log_rotation_size,
  $causal_clustering_raft_membership_state_size                      = $::neo4j::params::causal_clustering_raft_membership_state_size,
  $causal_clustering_raft_messages_log_enable                        = $::neo4j::params::causal_clustering_raft_messages_log_enable,
  $causal_clustering_raft_term_state_size                            = $::neo4j::params::causal_clustering_raft_term_state_size,
  $causal_clustering_raft_vote_state_size                            = $::neo4j::params::causal_clustering_raft_vote_state_size,
  $causal_clustering_read_replica_refresh_rate                       = $::neo4j::params::causal_clustering_read_replica_refresh_rate,
  $causal_clustering_read_replica_time_to_live                       = $::neo4j::params::causal_clustering_read_replica_time_to_live,
  $causal_clustering_relationship_group_id_allocation_size           = $::neo4j::params::causal_clustering_relationship_group_id_allocation_size,
  $causal_clustering_relationship_id_allocation_size                 = $::neo4j::params::causal_clustering_relationship_id_allocation_size,
  $causal_clustering_relationship_type_token_id_allocation_size      = $::neo4j::params::causal_clustering_relationship_type_token_id_allocation_size,
  $causal_clustering_relationship_type_token_name_id_allocation_size = $::neo4j::params::causal_clustering_relationship_type_token_name_id_allocation_size,
  $causal_clustering_replicated_lock_token_state_size                = $::neo4j::params::causal_clustering_replicated_lock_token_state_size,
  $causal_clustering_schema_id_allocation_size                       = $::neo4j::params::causal_clustering_schema_id_allocation_size,
  $causal_clustering_state_machine_apply_max_batch_size              = $::neo4j::params::causal_clustering_state_machine_apply_max_batch_size,
  $causal_clustering_state_machine_flush_window_size                 = $::neo4j::params::causal_clustering_state_machine_flush_window_size,
  $causal_clustering_string_block_id_allocation_size                 = $::neo4j::params::causal_clustering_string_block_id_allocation_size,
  $causal_clustering_transaction_advertised_address                  = $::neo4j::params::causal_clustering_transaction_advertised_address,
  $causal_clustering_transaction_listen_address                      = $::neo4j::params::causal_clustering_transaction_listen_address,
  $causal_clustering_unknown_address_logging_throttle                = $::neo4j::params::causal_clustering_unknown_address_logging_throttle,

  ### config cypher variables
  $cypher_default_language_version                                   = $::neo4j::params::cypher_default_language_version,
  $cypher_forbid_exhaustive_shortestpath                             = $::neo4j::params::cypher_forbid_exhaustive_shortestpath,
  $cypher_hints_error                                                = $::neo4j::params::cypher_hints_error,
  $cypher_min_replan_interval                                        = $::neo4j::params::cypher_min_replan_interval,
  $cypher_planner                                                    = $::neo4j::params::cypher_planner,
  $cypher_statistics_divergence_threshold                            = $::neo4j::params::cypher_statistics_divergence_threshold,
  $dbms_query_cache_size                                             = $::neo4j::params::dbms_query_cache_size,
  $dbms_security_allow_csv_import_from_file_urls                     = $::neo4j::params::dbms_security_allow_csv_import_from_file_urls,

  ### config connectors variables
  $dbms_connector_bolt_advertised_address                            = $::neo4j::params::dbms_connector_bolt_advertised_address,
  $dbms_connector_bolt_enabled                                       = $::neo4j::params::dbms_connector_bolt_enabled,
  $dbms_connector_bolt_listen_address                                = $::neo4j::params::dbms_connector_bolt_listen_address,
  $dbms_connector_http_advertised_address                            = $::neo4j::params::dbms_connector_http_advertised_address,
  $dbms_connector_http_enabled                                       = $::neo4j::params::dbms_connector_http_enabled,
  $dbms_connector_http_listen_address                                = $::neo4j::params::dbms_connector_http_listen_address,
  $dbms_connector_https_advertised_address                           = $::neo4j::params::dbms_connector_https_advertised_address,
  $dbms_connector_https_enabled                                      = $::neo4j::params::dbms_connector_https_enabled,
  $dbms_connector_https_listen_address                               = $::neo4j::params::dbms_connector_https_listen_address,
  $dbms_connectors_default_advertised_address                        = $::neo4j::params::dbms_connectors_default_advertised_address,
  $dbms_connectors_default_listen_address                            = $::neo4j::params::dbms_connectors_default_listen_address,
  $dbms_threads_worker_count                                         = $::neo4j::params::dbms_threads_worker_count,

  ### config clustering HA variables
  $ha_allow_init_cluster                                             = $::neo4j::params::ha_allow_init_cluster,
  $ha_branched_data_copying_strategy                                 = $::neo4j::params::ha_branched_data_copying_strategy,
  $ha_branched_data_policy                                           = $::neo4j::params::ha_branched_data_policy,
  $ha_broadcast_timeout                                              = $::neo4j::params::ha_broadcast_timeout,
  $ha_configuration_timeout                                          = $::neo4j::params::ha_configuration_timeout,
  $ha_data_chunk_size                                                = $::neo4j::params::ha_data_chunk_size,
  $ha_default_timeout                                                = $::neo4j::params::ha_default_timeout,
  $ha_election_timeout                                               = $::neo4j::params::ha_election_timeout,
  $ha_heartbeat_interval                                             = $::neo4j::params::ha_heartbeat_interval,
  $ha_heartbeat_timeout                                              = $::neo4j::params::ha_heartbeat_timeout,
  $ha_host_coordination                                              = $::neo4j::params::ha_host_coordination,
  $ha_host_data                                                      = $::neo4j::params::ha_host_data,
  $ha_initial_hosts                                                  = $::neo4j::params::ha_initial_hosts,
  $ha_internal_role_switch_timeout                                   = $::neo4j::params::ha_internal_role_switch_timeout,
  $ha_join_timeout                                                   = $::neo4j::params::ha_join_timeout,
  $ha_learn_timeout                                                  = $::neo4j::params::ha_learn_timeout,
  $ha_leave_timeout                                                  = $::neo4j::params::ha_leave_timeout,
  $ha_max_acceptors                                                  = $::neo4j::params::ha_max_acceptors,
  $ha_max_channels_per_slave                                         = $::neo4j::params::ha_max_channels_per_slave,
  $ha_paxos_timeout                                                  = $::neo4j::params::ha_paxos_timeout,
  $ha_phase1_timeout                                                 = $::neo4j::params::ha_phase1_timeout,
  $ha_phase2_timeout                                                 = $::neo4j::params::ha_phase2_timeout,
  $ha_pull_batch_size                                                = $::neo4j::params::ha_pull_batch_size,
  $ha_pull_interval                                                  = $::neo4j::params::ha_pull_interval,
  $ha_role_switch_timeout                                            = $::neo4j::params::ha_role_switch_timeout,
  $ha_server_id                                                      = $::neo4j::params::ha_server_id,
  $ha_slave_lock_timeout                                             = $::neo4j::params::ha_slave_lock_timeout,
  $ha_slave_only                                                     = $::neo4j::params::ha_slave_only,
  $ha_slave_read_timeout                                             = $::neo4j::params::ha_slave_read_timeout,
  $ha_tx_push_factor                                                 = $::neo4j::params::ha_tx_push_factor,
  $ha_tx_push_strategy                                               = $::neo4j::params::ha_tx_push_strategy,

  ### config monitoring logging variables
  $dbms_logs_query_enabled                                           = $::neo4j::params::dbms_logs_query_enabled,
  $dbms_logs_query_parameter_logging_enabled                         = $::neo4j::params::dbms_logs_query_parameter_logging_enabled,
  $dbms_logs_query_rotation_keep_number                              = $::neo4j::params::dbms_logs_query_rotation_keep_number,
  $dbms_logs_query_rotation_size                                     = $::neo4j::params::dbms_logs_query_rotation_size,
  $dbms_logs_query_threshold                                         = $::neo4j::params::dbms_logs_query_threshold,
  $dbms_logs_security_rotation_delay                                 = $::neo4j::params::dbms_logs_security_rotation_delay,
  $dbms_logs_security_rotation_keep_number                           = $::neo4j::params::dbms_logs_security_rotation_keep_number,
  $dbms_logs_security_rotation_size                                  = $::neo4j::params::dbms_logs_security_rotation_size,
  $dbms_security_log_successful_authentication                       = $::neo4j::params::dbms_security_log_successful_authentication,

  ### config monitoring metrics variables
  $metrics_bolt_messages_enabled                                     = $::neo4j::params::metrics_bolt_messages_enabled,
  $metrics_csv_enabled                                               = $::neo4j::params::metrics_csv_enabled,
  $metrics_csv_interval                                              = $::neo4j::params::metrics_csv_interval,
  $metrics_csv_path                                                  = $::neo4j::params::metrics_csv_path,
  $metrics_cypher_replanning_enabled                                 = $::neo4j::params::metrics_cypher_replanning_enabled,
  $metrics_enabled                                                   = $::neo4j::params::metrics_enabled,
  $metrics_graphite_enabled                                          = $::neo4j::params::metrics_graphite_enabled,
  $metrics_graphite_interval                                         = $::neo4j::params::metrics_graphite_interval,
  $metrics_graphite_server                                           = $::neo4j::params::metrics_graphite_server,
  $metrics_jvm_buffers_enabled                                       = $::neo4j::params::metrics_jvm_buffers_enabled,
  $metrics_jvm_gc_enabled                                            = $::neo4j::params::metrics_jvm_gc_enabled,
  $metrics_jvm_memory_enabled                                        = $::neo4j::params::metrics_jvm_memory_enabled,
  $metrics_jvm_threads_enabled                                       = $::neo4j::params::metrics_jvm_threads_enabled,
  $metrics_neo4j_causal_clustering_enabled                           = $::neo4j::params::metrics_neo4j_causal_clustering_enabled,
  $metrics_neo4j_checkpointing_enabled                               = $::neo4j::params::metrics_neo4j_checkpointing_enabled,
  $metrics_neo4j_cluster_enabled                                     = $::neo4j::params::metrics_neo4j_cluster_enabled,
  $metrics_neo4j_counts_enabled                                      = $::neo4j::params::metrics_neo4j_counts_enabled,
  $metrics_neo4j_enabled                                             = $::neo4j::params::metrics_neo4j_enabled,
  $metrics_neo4j_logrotation_enabled                                 = $::neo4j::params::metrics_neo4j_logrotation_enabled,
  $metrics_neo4j_network_enabled                                     = $::neo4j::params::metrics_neo4j_network_enabled,
  $metrics_neo4j_pagecache_enabled                                   = $::neo4j::params::metrics_neo4j_pagecache_enabled,
  $metrics_neo4j_server_enabled                                      = $::neo4j::params::metrics_neo4j_server_enabled,
  $metrics_neo4j_tx_enabled                                          = $::neo4j::params::metrics_neo4j_tx_enabled,
  $metrics_prefix                                                    = $::neo4j::params::metrics_prefix,

  ### config monitoring query management variables
  $dbms_transaction_timeout                                          = $::neo4j::params::dbms_transaction_timeout,

  ### config enterprise authentication variables
  $dbms_jvm_additional_ssl_keystore                                  = $::neo4j::params::dbms_jvm_additional_ssl_keystore,
  $dbms_jvm_additional_ssl_keystore_password                         = $::neo4j::params::dbms_jvm_additional_ssl_keystore_password,
  $dbms_jvm_additional_ssl_truststore                                = $::neo4j::params::dbms_jvm_additional_ssl_truststore,
  $dbms_jvm_additional_ssl_truststore_password                       = $::neo4j::params::dbms_jvm_additional_ssl_truststore_password,
  $dbms_security_auth_cache_max_capacity                             = $::neo4j::params::dbms_security_auth_cache_max_capacity,
  $dbms_security_auth_cache_ttl                                      = $::neo4j::params::dbms_security_auth_cache_ttl,
  $dbms_security_auth_enabled                                        = $::neo4j::params::dbms_security_auth_enabled,
  $dbms_security_auth_provider                                       = $::neo4j::params::dbms_security_auth_provider,
  $dbms_security_ha_status_auth_enabled                              = $::neo4j::params::dbms_security_ha_status_auth_enabled,
  $dbms_security_http_authorization_classes                          = $::neo4j::params::dbms_security_http_authorization_classes,
  $dbms_security_ldap_authentication_cache_enabled                   = $::neo4j::params::dbms_security_ldap_authentication_cache_enabled,
  $dbms_security_ldap_authentication_mechanism                       = $::neo4j::params::dbms_security_ldap_authentication_mechanism,
  $dbms_security_ldap_authentication_user_dn_template                = $::neo4j::params::dbms_security_ldap_authentication_user_dn_template,
  $dbms_security_ldap_authorization_group_membership_attributes      = $::neo4j::params::dbms_security_ldap_authorization_group_membership_attributes,
  $dbms_security_ldap_authorization_group_to_role_mapping            = $::neo4j::params::dbms_security_ldap_authorization_group_to_role_mapping,
  $dbms_security_ldap_authorization_system_password                  = $::neo4j::params::dbms_security_ldap_authorization_system_password,
  $dbms_security_ldap_authorization_system_username                  = $::neo4j::params::dbms_security_ldap_authorization_system_username,
  $dbms_security_ldap_authorization_use_system_account               = $::neo4j::params::dbms_security_ldap_authorization_use_system_account,
  $dbms_security_ldap_authorization_user_search_base                 = $::neo4j::params::dbms_security_ldap_authorization_user_search_base,
  $dbms_security_ldap_authorization_user_search_filter               = $::neo4j::params::dbms_security_ldap_authorization_user_search_filter,
  $dbms_security_ldap_connection_timeout                             = $::neo4j::params::dbms_security_ldap_connection_timeout,
  $dbms_security_ldap_host                                           = $::neo4j::params::dbms_security_ldap_host,
  $dbms_security_ldap_read_timeout                                   = $::neo4j::params::dbms_security_ldap_read_timeout,
  $dbms_security_ldap_referral                                       = $::neo4j::params::dbms_security_ldap_referral,
  $dbms_security_ldap_use_starttls                                   = $::neo4j::params::dbms_security_ldap_use_starttls,
  $dbms_security_procedures_default_allowed                          = $::neo4j::params::dbms_security_procedures_default_allowed,
  $dbms_security_procedures_roles                                    = $::neo4j::params::dbms_security_procedures_roles,
  $unsupported_dbms_security_ldap_authorization_connection_pooling   = $::neo4j::params::unsupported_dbms_security_ldap_authorization_connection_pooling,

  ### variables neo4j-wrapper.conf
  $dbms_memory_heap_initial_size                                     = $::neo4j::params::dbms_memory_heap_initial_size,
  $dbms_memory_heap_max_size                                         = $::neo4j::params::dbms_memory_heap_max_size,
  $dbms_jvm_additional_commit_memory_to_process                      = $::neo4j::params::dbms_jvm_additional_commit_memory_to_process,
  $dbms_jvm_additional_disable_explicit_gc                           = $::neo4j::params::dbms_jvm_additional_disable_explicit_gc,
  $dbms_jvm_additional_ephemeral_dh_keysize                          = $::neo4j::params::dbms_jvm_additional_ephemeral_dh_keysize,
  $dbms_jvm_additional_hashcode                                      = $::neo4j::params::dbms_jvm_additional_hashcode,
  $dbms_jvm_additional_jmxremote_access_file                         = $::neo4j::params::dbms_jvm_additional_jmxremote_access_file,
  $dbms_jvm_additional_jmxremote_authenticate                        = $::neo4j::params::dbms_jvm_additional_jmxremote_authenticate,
  $dbms_jvm_additional_jmxremote_password_file                       = $::neo4j::params::dbms_jvm_additional_jmxremote_password_file,
  $dbms_jvm_additional_jmxremote_port                                = $::neo4j::params::dbms_jvm_additional_jmxremote_port,
  $dbms_jvm_additional_jmxremote_ssl                                 = $::neo4j::params::dbms_jvm_additional_jmxremote_ssl,
  $dbms_jvm_additional_omit_stacktrace_in_fast_throw                 = $::neo4j::params::dbms_jvm_additional_omit_stacktrace_in_fast_throw,
  $dbms_jvm_additional_rmi_server_hostname                           = $::neo4j::params::dbms_jvm_additional_rmi_server_hostname,
  $dbms_jvm_additional_trust_final_non_static_fields                 = $::neo4j::params::dbms_jvm_additional_trust_final_non_static_fields,
  $dbms_jvm_additional_unlock_experimental_vm_options                = $::neo4j::params::dbms_jvm_additional_unlock_experimental_vm_options,
  $dbms_jvm_additional_unsupported_dbms_udc_source                   = $::neo4j::params::dbms_jvm_additional_unsupported_dbms_udc_source,
  $dbms_jvm_additional_use_g1gc                                      = $::neo4j::params::dbms_jvm_additional_use_g1gc,
  $dbms_windows_service_name                                         = $::neo4j::params::dbms_windows_service_name,

  ) inherits neo4j::params {

  ### validate absolute path
  validate_absolute_path( $install_prefix )

  ### validate booleans
  validate_bool(
    $browser_allow_outgoing_connections,
    $browser_retain_connection_credentials,
    $causal_clustering_cluster_allow_reads_on_followers,
    $causal_clustering_disable_middleware_logging,
    $causal_clustering_raft_messages_log_enable,
    $cypher_forbid_exhaustive_shortestpath,
    $cypher_hints_error,
    $dbms_allow_format_migration,
    $dbms_backup_enabled,
    $dbms_connector_bolt_enabled,
    $dbms_connector_http_enabled,
    $dbms_connector_https_enabled,
    $dbms_index_sampling_background_enabled,
    $dbms_jvm_additional_jmxremote_authenticate,
    $dbms_jvm_additional_jmxremote_ssl,
    $dbms_logs_gc_enabled,
    $dbms_logs_http_enabled,
    $dbms_logs_query_enabled,
    $dbms_logs_query_parameter_logging_enabled,
    $dbms_read_only,
    $dbms_security_allow_csv_import_from_file_urls,
    $dbms_security_allow_publisher_create_token,
    $dbms_security_auth_enabled,
    $dbms_security_ha_status_auth_enabled,
    $dbms_security_ldap_authentication_cache_enabled,
    $dbms_security_ldap_authorization_use_system_account,
    $dbms_security_ldap_use_starttls,
    $dbms_security_log_successful_authentication,
    $dbms_shell_enabled,
    $dbms_shell_read_only,
    $dbms_udc_enabled,
    $ha_allow_init_cluster,
    $ha_slave_only,
    $jmx_enable,
    $manage_repo,
    $metrics_bolt_messages_enabled,
    $metrics_csv_enabled,
    $metrics_cypher_replanning_enabled,
    $metrics_enabled,
    $metrics_graphite_enabled,
    $metrics_jvm_buffers_enabled,
    $metrics_jvm_gc_enabled,
    $metrics_jvm_memory_enabled,
    $metrics_jvm_threads_enabled,
    $metrics_neo4j_causal_clustering_enabled,
    $metrics_neo4j_checkpointing_enabled,
    $metrics_neo4j_cluster_enabled,
    $metrics_neo4j_counts_enabled,
    $metrics_neo4j_enabled,
    $metrics_neo4j_logrotation_enabled,
    $metrics_neo4j_network_enabled,
    $metrics_neo4j_pagecache_enabled,
    $metrics_neo4j_server_enabled,
    $metrics_neo4j_tx_enabled,
    $service_enable,
    $tools_consistency_checker_check_graph,
    $tools_consistency_checker_check_indexes,
    $tools_consistency_checker_check_label_scan_store,
    $tools_consistency_checker_check_property_owners,
    $unsupported_dbms_security_ldap_authorization_connection_pooling,
  )

  ### validate byte size
  validate_re( $causal_clustering_raft_log_rotation_size,  '[1-9][0-9]*(?i:[kmg])?' )
  validate_re( $dbms_memory_heap_initial_size,             '[1-9][0-9]*(?i:[kmg])?' )
  validate_re( $dbms_memory_heap_max_size,                 '[1-9][0-9]*(?i:[kmg])?' )
  validate_re( $dbms_index_sampling_buffer_size,           '[1-9][0-9]*(?i:[kmg])?' )
  validate_re( $dbms_logs_debug_rotation_size,             '[1-9][0-9]*(?i:[kmg])?' )
  validate_re( $dbms_logs_gc_rotation_size,                '[1-9][0-9]*(?i:[kmg])?' )
  validate_re( $dbms_logs_http_rotation_size,              '[1-9][0-9]*(?i:[kmg])?' )
  validate_re( $dbms_logs_query_rotation_size,             '[1-9][0-9]*(?i:[kmg])?' )
  validate_re( $dbms_logs_security_rotation_size,          '[1-9][0-9]*(?i:[kmg])?' )
  validate_re( $dbms_memory_pagecache_size,                '[1-9][0-9]*(?i:[kmg])?' )
  validate_re( $dbms_tx_log_rotation_size,                 '[1-9][0-9]*(?i:[kmg])?' )
  validate_re( $ha_data_chunk_size,                        '[1-9][0-9]*(?i:[kmg])?' )

  ### validate dbms_mode
  validate_re( $dbms_mode, '(ARBITER|CORE|HA|READ_REPLICA|SINGLE)' )

  ### validate duration
  validate_re( $browser_credential_timeout,                          '(0|[1-9][0-9]*)(ms|s|m)?' )
  validate_re( $causal_clustering_cluster_routing_ttl,               '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $causal_clustering_cluster_topology_refresh,          '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $causal_clustering_join_catch_up_timeout,             '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $causal_clustering_leader_election_timeout,           '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $causal_clustering_pull_interval,                     '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $causal_clustering_raft_log_pruning_frequency,        '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $causal_clustering_read_replica_refresh_rate,         '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $causal_clustering_read_replica_time_to_live,         '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $causal_clustering_unknown_address_logging_throttle,  '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $cypher_min_replan_interval,                          '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $dbms_checkpoint_interval_time,                       '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $dbms_logs_debug_rotation_delay,                      '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $dbms_logs_query_threshold,                           '(0|[1-9][0-9]*)(ms|s|m)?' )
  validate_re( $dbms_logs_security_rotation_delay,                   '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $dbms_rest_transaction_idle_timeout,                  '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $dbms_security_auth_cache_ttl,                        '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $dbms_security_ldap_connection_timeout,               '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $dbms_security_ldap_read_timeout,                     '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $dbms_transaction_timeout,                            '(0|[1-9][0-9]*)(ms|s|m)?' )
  validate_re( $ha_broadcast_timeout,                                '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_configuration_timeout,                            '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_default_timeout,                                  '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_election_timeout,                                 '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_heartbeat_interval,                               '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_heartbeat_timeout,                                '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_internal_role_switch_timeout,                     '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_join_timeout,                                     '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_learn_timeout,                                    '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_leave_timeout,                                    '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_paxos_timeout,                                    '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_phase1_timeout,                                   '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_phase2_timeout,                                   '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_pull_interval,                                    '(0|[1-9][0-9]*)(ms|s|m)?' )
  validate_re( $ha_role_switch_timeout,                              '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_slave_lock_timeout,                               '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $ha_slave_read_timeout,                               '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $metrics_csv_interval,                                '[1-9][0-9]*(ms|s|m)?' )
  validate_re( $metrics_graphite_interval,                           '[1-9][0-9]*(ms|s|m)?' )

  ### validate filesystem path
  validate_re( $dbms_directories_certificates,  '/?[0-9a-z_][0-9a-z_]*(/[0-9a-z_][0-9a-z_]*)*' )
  validate_re( $dbms_directories_data,          '/?[0-9a-z_][0-9a-z_]*(/[0-9a-z_][0-9a-z_]*)*' )
  validate_re( $dbms_directories_import,        '/?[0-9a-z_][0-9a-z_]*(/[0-9a-z_][0-9a-z_]*)*' )
  validate_re( $dbms_directories_lib,           '/?[0-9a-z_][0-9a-z_]*(/[0-9a-z_][0-9a-z_]*)*' )
  validate_re( $dbms_directories_logs,          '/?[0-9a-z_][0-9a-z_]*(/[0-9a-z_][0-9a-z_]*)*' )
  validate_re( $dbms_directories_metrics,       '/?[0-9a-z_][0-9a-z_]*(/[0-9a-z_][0-9a-z_]*)*' )
  validate_re( $dbms_directories_plugins,       '/?[0-9a-z_][0-9a-z_]*(/[0-9a-z_][0-9a-z_]*)*' )
  validate_re( $dbms_directories_run,           '/?[0-9a-z_][0-9a-z_]*(/[0-9a-z_][0-9a-z_]*)*' )
  validate_re( $metrics_csv_path,               '/?[0-9a-z_][0-9a-z_]*(/[0-9a-z_][0-9a-z_]*)*' )

  ### validate hostname and port
  validate_re( $dbms_backup_address,                  '([a-z][0-9a-z_]*(\.[0-9a-z]_)*)?:[1-9][0-9]*' )
  validate_re( $dbms_connector_bolt_listen_address,   '([a-z][0-9a-z_]*(\.[0-9a-z]_)*)?:[1-9][0-9]*' )
  validate_re( $dbms_connector_http_listen_address,   '([a-z][0-9a-z_]*(\.[0-9a-z]_)*)?:[1-9][0-9]*' )
  validate_re( $dbms_connector_https_listen_address,  '([a-z][0-9a-z_]*(\.[0-9a-z]_)*)?:[1-9][0-9]*' )
  validate_re( $ha_host_coordination,                 '([a-z][0-9a-z_]*(\.[0-9a-z]_)*)?:[1-9][0-9]*' )
  validate_re( $ha_host_data,                         '([a-z][0-9a-z_]*(\.[0-9a-z]_)*)?:[1-9][0-9]*' )
  validate_re( $metrics_graphite_server,              '([a-z][0-9a-z_]*(\.[0-9a-z]_)*)?:[1-9][0-9]*' )

  ### validate arrays
  validate_array( $browser_remote_content_hostname_whitelist )

  ### validate integers
  validate_integer([
    $causal_clustering_catchup_batch_size,
    $causal_clustering_expected_core_cluster_size,
    $causal_clustering_last_applied_state_size,
    $causal_clustering_log_shipping_max_lag,
    $causal_clustering_outgoing_queue_size,
    $causal_clustering_raft_log_reader_pool_size,
    $dbms_checkpoint_interval_tx,
    $dbms_index_sampling_sample_size_limit,
    $dbms_index_searcher_cache_size,
    $dbms_logs_debug_rotation_keep_number,
    $dbms_logs_gc_rotation_keep_number,
    $dbms_logs_http_rotation_keep_number,
    $dbms_logs_query_rotation_keep_number,
    $dbms_logs_security_rotation_keep_number,
    $dbms_query_cache_size,
    $dbms_relationship_grouping_threshold,
    $dbms_shell_port,
    $ha_max_acceptors,
    $ha_max_channels_per_slave,
    $ha_pull_batch_size,
    $ha_tx_push_factor,
    $service_ulimit,
    $service_shutdown_timeout
  ])

  ### validate strings
  validate_string(
    $causal_clustering_raft_log_implementation,
    $causal_clustering_raft_log_prune_strategy,
    $dbms_active_database,
    $dbms_connectors_default_advertised_address,
    $dbms_connectors_default_listen_address,
    $dbms_jvm_additional_commit_memory_to_process,
    $dbms_jvm_additional_disable_explicit_gc,
    $dbms_jvm_additional_ephemeral_dh_keysize,
    $dbms_jvm_additional_jmxremote_access_file,
    $dbms_jvm_additional_omit_stacktrace_in_fast_throw,
    $dbms_jvm_additional_rmi_server_hostname,
    $dbms_jvm_additional_ssl_keystore,
    $dbms_jvm_additional_ssl_keystore_password,
    $dbms_jvm_additional_ssl_truststore,
    $dbms_jvm_additional_ssl_truststore_password,
    $dbms_jvm_additional_trust_final_non_static_fields,
    $dbms_jvm_additional_unlock_experimental_vm_options,
    $dbms_jvm_additional_unsupported_dbms_udc_source,
    $dbms_jvm_additional_use_g1gc,
    $dbms_memory_pagecache_swapper,
    $dbms_mode,
    $dbms_record_format,
    $dbms_security_auth_provider,
    $dbms_security_ldap_authentication_mechanism,
    $dbms_security_ldap_authentication_user_dn_template,
    $dbms_security_ldap_authorization_group_to_role_mapping,
    $dbms_security_ldap_authorization_system_password,
    $dbms_security_ldap_authorization_system_username,
    $dbms_security_ldap_authorization_user_search_base,
    $dbms_security_ldap_authorization_user_search_filter,
    $dbms_security_ldap_host,
    $dbms_security_ldap_referral,
    $dbms_security_procedures_default_allowed,
    $dbms_security_procedures_roles,
    $dbms_shell_host,
    $dbms_shell_rmi_name,
    $dbms_tx_log_rotation_retention_policy,
    $edition,
    $group,
    $ha_tx_push_strategy,
    $install_method,
    $metrics_prefix,
    $service_ensure,
    $service_name,
    $user,
    $version,
  )

  #http://www.neo4j.com/customer/download/neo4j-enterprise-2.1.4-unix.tar.gz
  $source_name     = "neo4j-${edition}-${version}"
  $source_tarball = "${source_name}.tgz"

  if ( $::kernel != 'Linux' ) {
    fail('Only Linux is supported at this time.')
  }

  if !( $edition in ['community', 'enterprise'] ){
    fail('Only edtions \'community\' and \'enterprise\' are present.')
  }

  if ( $edition == 'enterprise' ) {
    $package_name = "neo4j-${edition}"
  } else {
    $package_name = 'neo4j'
  }

  case $install_method {
    'package': {
      if ( $version =~ /[\d.]+/ and versioncmp( $version, '3.0.0' ) < 0 ) {
        fail('Only versions >= 3.0.0 are supported at this time.')
      }
      $neo4j_home = "${install_prefix}/neo4j"
    }
    'archive': {
      if ( versioncmp( $version, '3.0.0' ) < 0 ) {
        fail('Only versions >= 3.0.0 are supported at this time.')
      }
      $neo4j_home = "${install_prefix}/${source_name}"
    }
    default: {
      fail("Installation method ${install_method} not supported.")
    }
  }

  if ( is_absolute_path( $dbms_directories_data )) {
    $data_dir = $dbms_directories_data
  } else {
    $data_dir = "${install_prefix}/${dbms_directories_data}"
  }

  if ( is_absolute_path( $dbms_directories_logs )) {
    $logs_dir = $dbms_directories_logs
  } else {
    $logs_dir = "${install_prefix}/${dbms_directories_logs}"
  }

  if ( $dbms_mode in ['HA', 'ARBITER', 'CORE', 'READ_REPLICA'] ){
    if ( !is_numeric( $ha_server_id ) ) {
      fail('The Server Id value must be specified and must numeric.')
    }
  }

  anchor { 'neo4j::begin': } ->
  class{'::neo4j::install':} ->
  class{'::neo4j::config':} ~>
  class{'::neo4j::service':} ->
  anchor { 'neo4j::end': }
}
