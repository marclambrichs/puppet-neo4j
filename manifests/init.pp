# == Class: neo4j
#
# Installs Neo4J (http://www.neo4j.com) on RHEL/Ubuntu/Debian from their
# distribution tarballs downloaded directly from their site.
#
# === Parameters
#
# @param browser_allow_outgoing_connections [Boolean] Configure the policy for
#   outgoing Neo4j Browser connections.
#
# @param browser_credential_timeout [Pattern[/[1-9][0-9]*(ms|s|m)?/]] Configure
#   the Neo4j Browser to time out logged in users after this idle period.
#
# @param browser_remote_content_hostname_whitelist [String] Whitelist of hosts
#   for the Neo4j Browser to be allowed to fetch content from.
#
# @param browser_retain_connection_credentials [Boolean] Configure the Neo4j
#   Browser to store or not store user credentials.
#
# @param causal_clustering_array_block_id_allocation_size [Integer] The size of
#   the ID allocation requests Core servers will make when they run out of
#   ARRAY_BLOCK IDs.
#   (Since 3.1)
#
# @param causal_clustering_catchup_batch_size [Integer] The maximum batch size
#   when catching up (in unit of entries).
#   (Since 3.1)
#
# @param causal_clustering_cluster_allow_reads_on_followers [Boolean] Configure
#   if the dbms.cluster.routing.getServers() procedure should include followers
#   as read endpoints or return only read replicas.
#   (Since 3.1)
#
# @param causal_clustering_cluster_routing_ttl [Pattern[/[1-9][0-9]{3,}(ms|s|m)?/]]
#   How long drivers should cache the data from the dbms.cluster.routing.getServers()
#   procedure.
#   (Since 3.1)
#
# @param causal_clustering_cluster_topology_refresh [Pattern[/[1-9][0-9]{3,}(ms|s|m)?/]]
#   Time between scanning the cluster to refresh current server’s view of
#   topology.
#   (Since 3.1)
#
# @param causal_clustering_disable_middleware_logging [Boolean] Prevents the net
#   work middleware from dumping its own logs.
#   (Since 3.1)
#
# @param causal_clustering_discovery_advertised_address
#   [Pattern[/[a-z]+(:[1-6][0-5]?[0-5]?[0-3]?[0-5]?)/]] Advertised cluster
#   member discovery management communication.
#   (Since 3.1)
#
# @param causal_clustering_discovery_listen_address [Pattern[/[^:]+:[1-9][0-9]{4}/]]
#   Host and port to bind the cluster member discovery management communication.
#   (Since 3.1)
#
# @param causal_clustering_expected_core_cluster_size [Integer] Expected number
#   of Core machines in the cluster.
#   (Since 3.1)
#
# @param causal_clustering_global_session_tracker_state_size [Integer] The
#   maximum file size before the global session tracker state file is rotated
#   (in unit of entries).
#   (Since 3.1)
#
# @param causal_clustering_id_alloc_state_size [Integer] The maximum file size
#   before the ID allocation file is rotated (in unit of entries).
#   (Since 3.1)
#
# @param causal_clustering_initial_discovery_members [Array[Pattern[/[^:]+:[1-9][0-9]{4}/]]]
#   A comma-separated list of other members of the cluster to join.
#   (Since 3.1)
#
# @param causal_clustering_join_catch_up_timeout [Pattern[/[1-9][0-9]{3,}(ms|s|m)?/]]
#   Time out for a new member to catch up.
#   (Since 3.1)
#
# @param causal_clustering_label_token_id_allocation_size [Integer] The size of
#   the ID allocation requests Core servers will make when they run out of
#   LABEL_TOKEN IDs.
#   (Since 3.1)
#
# @param causal_clustering_label_token_name_id_allocation_size [Integer] The
#   size of the ID allocation requests Core servers will make when they run
#   out of LABEL_TOKEN_NAME IDs.
#   (Since 3.1)
#
# @param causal_clustering_last_applied_state_size [Integer] The maximum file
#   size before the storage file is rotated (in unit of entries).
#   (Since 3.1)
#
# @param causal_clustering_leader_election_timeout [Pattern[/[1-9][0-9]*(ms|s|m)?/]]
#   The time limit within which a new leader election will occur if no messages
#   are received.
#   (Since 3.1)
#
# @param causal_clustering_log_shipping_max_lag [Integer] The maximum lag
#   allowed before log shipping pauses (in unit of entries).
#   (Since 3.1)
#
# @param causal_clustering_neostore_block_id_allocation_size [Integer] The size
#   of the ID allocation requests Core servers will make when they run out of
#   NEOSTORE_BLOCK IDs.
#   (Since 3.1)
#
# @param causal_clustering_node_id_allocation_size [Integer] The size of the ID
#   allocation requests Core servers will make when they run out of NODE IDs.
#   (Since 3.1)
#
# @param causal_clustering_node_labels_id_allocation_size [Integer] The size of
#   the ID allocation requests Core servers will make when they run out of
#   NODE_LABELS IDs.
#   (Since 3.1)
#
# @param causal_clustering_outgoing_queue_size [Integer] The number of messages
#   waiting to be sent to other servers in the cluster.
#   (Since 3.1)
#
# @param causal_clustering_property_id_allocation_size [Integer] The size of the
#   ID allocation requests Core servers will make when they run out of PROPERTY
#   IDs.
#   (Since 3.1)
#
# @param causal_clustering_property_key_token_id_allocation_size [Integer] The
#   size of the ID allocation requests Core servers will make when they run out
#   of PROPERTY_KEY_TOKEN IDs.
#   (Since 3.1)
#
# @param causal_clustering_property_key_token_name_id_allocation_size [Integer]
#   The size of the ID allocation requests Core servers will make when they run
#   out of PROPERTY_KEY_TOKEN_NAME IDs.
#   (Since 3.1)
#
# @param causal_clustering_pull_interval Pattern[/[1-9][0-9]*(ms|s|m)/] Interval
#   of pulling updates from cores.
#   (Since 3.1)
#
# @param causal_clustering_raft_advertised_address [Pattern[/[^:]+:[1-9][0-9]{4}/]]
#   Advertised hostname/IP address and port for the RAFT server.
#   (Since 3.1)
#
# @param causal_clustering_raft_listen_address [Pattern[/[^:]+:[1-9][0-9]{4}/]]
#   Network interface and port for the RAFT server to listen on.
#   (Since 3.1)
#
# @param causal_clustering_raft_log_implementation [String] RAFT log
#   implementation.
#   (Since 3.1)
#
# @param causal_clustering_raft_log_prune_strategy [String] RAFT log pruning
#   strategy.
#   (Since 3.1)
#
# @param causal_clustering_raft_log_pruning_frequency Pattern[/[1-9][0-9]*(ms|s|m)/]
#   RAFT log pruning frequency.
#   (Since 3.1)
#
# @param causal_clustering_raft_log_reader_pool_size [Integer] RAFT log reader
#   pool size.
#   (Since 3.1)
#
# @param causal_clustering_raft_log_rotation_size Pattern[/[1-9][0-9]*[kKmMgG]?/]
#   RAFT log rotation size.
#   (Since 3.1)
#
# @param causal_clustering_raft_membership_state_size [Integer] The maximum file
#   size before the membership state file is rotated (in unit of entries).
#   (Since 3.1)
#
# @param causal_clustering_raft_messages_log_enable [Boolean] Enable or disable
#   the dump of all network messages pertaining to the RAFT protocol.
#   (Since 3.1)
#
# @param causal_clustering_raft_term_state_size [Integer] The maximum file size
#   before the term state file is rotated (in unit of entries).
#   (Since 3.1)
#
# @param causal_clustering_raft_vote_state_size [Integer] The maximum file size
#   before the vote state file is rotated (in unit of entries).
#   (Since 3.1)
#
# @param causal_clustering_read_replica_refresh_rate Pattern[/[1-9][0-9]*(ms|s|m)/]
#   Read replica 'call home' frequency.
#   (Since 3.1)
#
# @param causal_clustering_read_replica_time_to_live Pattern[/[1-9][0-9]*(ms|s|m)/]
#   Time To Live before read replica is considered unavailable.
#   (Since 3.1)
#
# @param causal_clustering_relationship_group_id_allocation_size [Integer] The
#   size of the ID allocation requests Core servers will make when they run out
#   of RELATIONSHIP_GROUP IDs.
#   (Since 3.1)
#
# @param causal_clustering_relationship_id_allocation_size [Integer] The size of
#   the ID allocation requests Core servers will make when they run out of
#   RELATIONSHIP IDs.
#   (Since 3.1)
#
# @param causal_clustering_relationship_type_token_id_allocation_size [Integer]
#   The size of the ID allocation requests Core servers will make when they run
#   out of RELATIONSHIP_TYPE_TOKEN IDs.
#   (Since 3.1)
#
# @param causal_clustering_relationship_type_token_name_id_allocation_size [Integer]
#   The size of the ID allocation requests Core servers will make when they run
#   out of RELATIONSHIP_TYPE_TOKEN_NAME IDs.
#   (Since 3.1)
#
# @param causal_clustering_replicated_lock_token_state_size [Integer] The
#   maximum file size before the replicated lock token state file is rotated (in
#   unit of entries).
#   (Since 3.1)
#
# @param causal_clustering_schema_id_allocation_size [Integer] The size of the
#   ID allocation requests Core servers will make when they run out of SCHEMA
#   IDs.
#   (Since 3.1)
#
# @param causal_clustering_state_machine_apply_max_batch_size [Integer] The
#   maximum number of operations to be batched during applications of operations
#   in the state machines.
#   (Since 3.1)
#
# @param causal_clustering_state_machine_flush_window_size [Integer] The number
#   of operations to be processed before the state machines flush to disk.
#   (Since 3.1)
#
# @param causal_clustering_string_block_id_allocation_size [Integer] The size of
#   the ID allocation requests Core servers will make when they run out of
#   STRING_BLOCK IDs.
#   (Since 3.1)
#
# @param causal_clustering_transaction_advertised_address [Pattern[/[^:]+:[1-9][0-9]{4}/]]
#   Advertised hostname/IP address and port for the transaction shipping server.
#   (Since 3.1)
#
# @param causal_clustering_transaction_listen_address [Pattern[/[^:]+:[1-9][0-9]{4}/]]
#   Network interface and port for the transaction shipping server to listen on.
#   (Since 3.1)
#
# @param causal_clustering_unknown_address_logging_throttle [Pattern[/[1-9][0-9]*(ms|s|m)/]]
#   Throttle limit for logging unknown cluster member address.
#   (Since 3.1)
#
# @param cypher_default_language_version [Enum['2.3', '3.0', '3.1', 'default']]
#   Set this to specify the default parser (language version).
#
# @param cypher_forbid_exhaustive_shortestpath [Boolean] This setting is
#   associated with performance optimization.
#
# @param cypher_hints_error [Boolean] Set this to specify the behavior when
#   Cypher planner or runtime hints cannot be fulfilled.
# Type: boolean
#
# @param cypher_min_replan_interval [Pattern[/[1-9][0-9]*(ms|s|m)?/]] The
#   minimum lifetime of a query plan before a query is considered for replanning.
#
# @param cypher_planner [Enum['COST', 'RULE', 'default']] Set this to specify
#   the default planner for the default language version.
#
# @param cypher_statistics_divergence_threshold [Float[0.0, 1.0]] The threshold
#   when a plan is considered stale.
#
# @param data_prefix [Pattern[/\/([^/\0]+(\/)?)+]] Determines the directory
#   where neo4j data dirs will be installed.
#
# @param dbms_active_database [String] Name of the database to load.
#
# @param dbms_allow_format_migration [Boolean] Whether to allow a store upgrade
#   in case the current version of the database starts against an older store
#   version.
#
# @param dbms_backup_address [Pattern[/[^:]+:[1-9][0-9]{4}/]] Listening server
#   for online backups.
#
# @param dbms_backup_enabled [Boolean] Enable support for running online backups
#
# @param dbms_checkpoint_interval_time [Pattern[/[1-9][0-9]*(ms|s|m)/]]
#   Configures the time interval between check-points.
#
# @param dbms_checkpoint_interval_tx [Pattern[/[1-9][0-9]*/]] Configures the
#   transaction interval between check-points.
#
# @param dbms_checkpoint_iops_limit [Integer] Limit the number of IOs the
#   background checkpoint process will consume per second.
#
# @param dbms_connector_bolt_advertised_address [Pattern[/[^:]+:[1-9][0-9]{4}/]]
#   The advertised_address setting specifies the address clients should use for
#   this connector. This is useful in a causal cluster as it allows each server
#   to correctly advertise addresses of the other servers in the cluster.
#
# @param dbms_connector_bolt_enabled [Boolean] The enabled setting allows the
#   client connector to be enabled or disabled. When disabled, Neo4j does not
#   listen for incoming connections on the relevant port.
#
# @param dbms_connector_bolt_listen_address [Pattern[/[^:]*:[1-9][0-9]{4}/]] The
#   listen_address setting specifies how Neo4j listens for incoming connections.
#
# @param dbms_connector_http_advertised_address The advertised_address setting
#   specifies the address clients should use for this connector. This is useful
#   in a causal cluster as it allows each server to correctly advertise
#   addresses of the other servers in the cluster.
#
# @param dbms_connector_http_enabled [Boolean] The enabled setting allows the
#   client connector to be enabled or disabled. When disabled, Neo4j does not
#   listen for incoming connections on the relevant port.
#
# @param dbms_connector_http_listen_address [Pattern[/[^:]*:[1-9][0-9]{4}/]] The
#   listen_address setting specifies how Neo4j listens for incoming connections.
#
# @param dbms_connector_https_advertised_address The advertised_address setting
#   specifies the address clients should use for this connector. This is useful
#   in a causal cluster as it allows each server to correctly advertise
#   addresses of the other servers in the cluster.
#
# @param dbms_connector_https_enabled [Boolean] The enabled setting allows the
#   client connector to be enabled or disabled. When disabled, Neo4j does not
#   listen for incoming connections on the relevant port.
#
# @param dbms_connector_https_listen_address [Pattern[/[^:]+:[1-9][0-9]{4}/]]
#   The listen_address setting specifies how Neo4j listens for incoming
#   connections.
#
# @param dbms_connectors_default_advertised_address [String] Default hostname or
#   IP address the server uses to advertise itself to its connectors.
#   (Since 3.1)
#
# @param dbms_connectors_default_listen_address [String] Default network
#   interface to listen for incoming connections.
#   (Since 3.1)
#
# @param dbms_directories_certificates [Pattern[/(\/)?([^/\0]+(\/)?)+/]]
#   Directory for storing certificates to be used by Neo4j for TLS connections.
#
# @param dbms_directories_data [Pattern[/(\/)?([^/\0]+(\/)?)+/]] Path of the
#   data directory.
#
# @param dbms_directories_import [Pattern[/(\/)?([^/\0]+(\/)?)+/]] Sets the root
#   directory for file URLs used with the Cypher LOAD CSV clause.
#
# @param dbms_directories_lib [Pattern[/(\/)?([^/\0]+(\/)?)+/]] Path of the lib
#   directory.
#
# @param dbms_directories_logs [Pattern[/(\/)?([^/\0]+(\/)?)+/]] Path of the
#   logs directory.
#
# @param dbms_directories_metrics [Pattern[/(\/)?([^/\0]+(\/)?)+/]] The target
#   location of the CSV files: a path to a directory wherein a CSV file per
#   reported field will be written.
#
# @param dbms_directories_plugins [Pattern[/(\/)?([^/\0]+(\/)?)+/]] Location of
#   the database plugin directory.
#
# @param dbms_directories_run [Pattern[/(\/)?([^/\0]+(\/)?)+/]] Path of the run
#   directory.
#
# @param dbms_memory_heap_initial_size [Pattern[/[1-9][0-9]*[kKmMgG]?/]] Initial
#   size of the heap
#
# @param dbms_memory_heap_max_size [Pattern[/[1-9][0-9]*[kKmMgG]?/]] Upper
#   boundary of memory heap.
#
# @param dbms_ids_reuse_types_override [Enum['NODE', 'RELATIONSHIP']] Specified
#   names of id types (comma separated) that should be reused.
#   (Since 3.1)
#
# @param dbms_index_sampling_background_enabled [Boolean] Enable or disable back
#   ground index sampling.
#
# @param dbms_index_sampling_buffer_size [Pattern[/[1-9][0-9]*[kKmMgG]?/] which
#   is minimum 1048576, maximum 2147483647] Size of buffer used by index
#   sampling.
#   Depracated: since 3.0.3. Use dbms.index_sampling.sample_size_limit instead.
#
# @param dbms_index_sampling_sample_size_limit [Integer[1048576, 2147483647]]
#   Index sampling chunk size limit.
#
# @param dbms_index_sampling_update_percentage [Integer] Percentage of index
#   updates of total index size required before sampling of a given index is
#   triggered.
#
# @param dbms_jvm_additional_commit_memory_to_process [String] Make sure that
#   `initmemory` is not only allocated but committed to the process, before
#   starting the database.
#
# @param dbms_jvm_additional_disable_explicit_gc [String] Disable explicit
#   garbage collection.
#
# @param dbms_jvm_additional_ephemeral_dh_keysize [String] Expand Diffie Helman
#   (DH) key size form default 1024 to 2048 for DH-RSA cipher suites used in
#   serverl TLS handshakes.
#
# @param dbms_jvm_additional_hashcode Reduce probability of objects getting the
#   same identity hash code via a race, by computing them with thread-local PRNGs.
#
# @param dbms_index_searcher_cache_size [Integer[1]] The maximum number of open
#   Lucene index searchers.
#
# @param dbms_jvm_additional_jmxremote_access_file [String] This settings is
#   used for exposing the JMX.
#
# @param dbms_jvm_additional_jmxremote_authenticate [Boolean] This settings is
#   used for exposing the JMX.
#
# @param dbms_jvm_additional_jmxremote_password_file [Boolean] This settings is
#   used for exposing the JMX.
#
# @param dbms_jvm_additional_jmxremote_port [Integer] This settings is used for
#   exposing the JMX.
#
# @param dbms_jvm_additional_jmxremote_ssl [Boolean] This settings is used for
#   exposing the JMX.
#
# @param dbms_jvm_additional_omit_stacktrace_in_fast_throw [String] Have common
#   exceptions keep producing stack traces, so they can be debugged regardless
#   of how often logs are rotated.
#
# @param dbms_jvm_additional_rmi_server_hostname [String] Some systems cannot
#   discover host name automatically, and need rmi server hostname explicitly
#   stated.
#
# @param dbms_jvm_additional_ssl_keystore [String] For using self-signed
#   certificate in a test environment.
#
# @param dbms_jvm_additional_ssl_keystore_password [String] For using
#   self-signed certificate in a test environment.
#
# @param dbms_jvm_additional_ssl_truststore [String] For using self-signed
#   certificate in a test environment.
#
# @param dbms_jvm_additional_ssl_truststore_password [String] For using
#   self-signed certificate in a test environment.
#
# @param dbms_jvm_additional_trust_final_non_static_fields [String] Trust that
#   non-static final fields are really final.
#
# @param dbms_jvm_additional_unlock_experimental_vm_options [String] Allows for
#   more optimisations and improves overall performance. Not to be used in
#   embedded mode.
#
# @param dbms_jvm_additional_unsupported_dbms_udc_source [String] ??
#
# @param dbms_jvm_additional_use_g1gc [String] G1GC generally strikes a good
#   balance between throughput and tail latency, without too much tuning.
#
# @param dbms_logs_debug_level [Enum['DEBUG', 'INFO', 'WARN', 'ERROR', 'NONE']]
#   Debug log level threshold.
#
# @param dbms_logs_debug_rotation_delay [Pattern[/[1-9][0-9]*(ms|s|m)?/]]
#   Minimum time interval after last rotation of the debug log before it may be
#   rotated again.
#
# @param dbms_logs_debug_rotation_keep_number [Integer[1]] Maximum number of
#   history files for the debug log.
#
# @param dbms_logs_debug_rotation_size [Pattern[/[1-9][0-9]*[kKmMgG]?/]]
#   Threshold for rotation of the debug log.
#
# @param dbms_logs_gc_enabled [Boolean] Enable GC Logging.
#
# @param dbms_logs_gc_options [Array[String]] GC Logging Options.
#
# @param dbms_logs_gc_rotation_keep_number [Integer] Number of GC logs to keep.
#
# @param dbms_logs_gc_rotation_size [Pattern[/[0-9][0-9]*[kKmMgG]?/]] Size of
#   each GC log that is kept, which is minimum 0, maximum 9223372036854775807.
#
# @param dbms_logs_http_enabled [Boolean] Enable HTTP request logging.
#
# @param dbms_logs_http_rotation_keep_number [Integer] Number of HTTP logs to
#   keep.
#
# @param dbms_logs_http_rotation_size [Pattern[/[1-9][0-9]*[kKmMgG]?/]] Size of
#   each HTTP log that is kept which is minimum 0, maximum 9223372036854775807.
#
# @param dbms_logs_query_enabled [Boolean] Log executed queries that take longer
#   than the configured threshold, dbms.logs.query.threshold.
#
# @param dbms_logs_query_parameter_logging_enabled [Boolean] Log parameters for
#   executed queries that took longer than the configured threshold.
#
# @param dbms_logs_query_rotation_keep_number [Integer[1]] Maximum number of
#   history files for the query log.
#
# @param dbms_logs_query_rotation_size [Pattern[/[0-9][0-9]*[kKmMgG]?/]] The
#   file size in bytes at which the query log will auto-rotate which is minimum
#   0, maximum 9223372036854775807.
#
# @param dbms_logs_query_threshold [Pattern[/[0-9]{1,}(ms|s|m)?/]] If the
#   execution of query takes more time than this threshold, the query is logged
#   - provided query logging is enabled. Setting this param to 0 will result in
#   all queries being logged.
#
# @param dbms_logs_security_level [Enum['DEBUG', 'INFO', 'WARN', 'ERROR', 'NONE']]
#   Security log level threshold.
#   (Since 3.1)
#
# @param dbms_logs_security_rotation_delay [Pattern[/[1-9][0-9]*(ms|s|m)?/]]
#   Minimum time interval after last rotation of the security log before it may
#   be rotated again.
#   (Since 3.1)
#
# @param dbms_logs_security_rotation_keep_number [Integer] Maximum number of
#   history files for the security log.
#   (Since 3.1)
#
# @param dbms_logs_security_rotation_size [Pattern[/[1-9][0-9]*[kKmMgG]?/]]
#   Threshold for rotation of the security log.
#   (Since 3.1)
#
# @param dbms_memory_pagecache_size [Pattern[/[1-9][0-9]*[kKmMgG]?/]] The amount
#   of memory to use for mapping the store files, in bytes (or kilobytes with
#   the 'k' suffix, megabytes with 'm' and gigabytes with 'g').
#
# @param dbms_memory_pagecache_swapper [String] Specify which page swapper to
#   use for doing paged IO.
#
# @param dbms_mode [Enum['SINGLE', 'HA', 'ARBITER', 'CORE', 'READ_REPLICA']]
#
# @param dbms_query_cache_size [Integer[0]] The number of Cypher query execution
#   plans that are cached.
#
# @param dbms_read_only [Boolean] Only allow read operations from this Neo4j
#   instance.
#
# @param dbms_record_format [Enum['standard', 'high_limit']] Database record
#   format.
#
# @param dbms_relationship_grouping_threshold [Integer[1]] Relationship count
#   threshold for considering a node to be dense.
#
# @param dbms_rest_transaction_idle_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]]
#   Timeout for idle transactions in the REST endpoint.
#
# @param dbms_security_allow_csv_import_from_file_urls [Boolean] Determines if
#   Cypher will allow using file URLs when loading data using LOAD CSV.
#
# @param dbms_security_allow_publisher_create_token [Boolean] Set to true if
#   users with role publisher are allowed to create new tokens.
#   (Since 3.1)
#
# @param dbms_security_auth_cache_max_capacity [Integer] The maximum capacity
#   for authentication and authorization caches (respectively).
#   (Since 3.1)
#
# @param dbms_security_auth_cache_ttl [Pattern[/[1-9][0-9]*(ms|s|m)?/]] The time
#   to live (TTL) for cached authentication and authorization info when using
#   external auth providers (LDAP or plugin).
#   (Since 3.1)
#
# @param dbms_security_auth_enabled [Boolean] Enable auth requirement to access
#   Neo4j.
#
# @param dbms_security_auth_provider [Enum['native', 'ldap']] The authentication
#   and authorization provider that contains both the users and roles.
#   (Since 3.1)
#
# @param dbms_security_ha_status_auth_enabled [Boolean] Require authorization
#   for access to the HA status endpoints.
#
# @param dbms_security_http_authorization_classes [Tuple[String, 1, default]]
#   Comma-seperated list of custom security rules for Neo4j to use.
#
# @param dbms_security_ldap_authentication_cache_enabled [Boolean] Determines if
#   the result of authentication via the LDAP server should be cached or not.
#   (Since 3.1)
#
# @param dbms_security_ldap_authentication_mechanism [Enum['simple', 'DIGEST-MD5']]
#   LDAP authentication mechanism.
#   (Since 3.1)
#
# @param dbms_security_ldap_authentication_user_dn_template [String] LDAP user
#   DN template.
#   (Since 3.1)
#
# @param dbms_security_ldap_authorization_group_membership_attributes [Tuple[String, 1, default]]
#   A list of attribute names on a user object that contains groups to be used
#   for mapping to roles when LDAP authorization is enabled.
#   (Since 3.1)
#
# @param dbms_security_ldap_authorization_group_to_role_mapping [String] An
#   authorization mapping from LDAP group names to Neo4j role names.
#   (Since 3.1)
#
# @param dbms_security_ldap_authorization_system_password [String] An LDAP
#   system account password to use for authorization searches when
#   dbms.security.ldap.authorization.use_system_account is true.
#   (Since 3.1)
#
# @param dbms_security_ldap_authorization_system_username [String] An LDAP
#   system account username to use for authorization searches when
#   dbms.security.ldap.authorization.use_system_account is true.
#   (Since 3.1)
#
# @param dbms_security_ldap_authorization_use_system_account [Boolean] Perform
#   LDAP search for authorization info using a system account instead of the
#   user’s own account. If this is set to false (default), the search for group
#   membership will be performed directly after authentication using the LDAP
#   context bound with the user’s own account.
#   (Since 3.1)
#
# @param dbms_security_ldap_authorization_user_search_base [String] The name of
#   the base object or named context to search for user objects when LDAP
#   authorization is enabled.
#   (Since 3.1)
#
# @param dbms_security_ldap_authorization_user_search_filter [String] The LDAP
#   search filter to search for a user principal when LDAP authorization is
#   enabled.
#   (Since 3.1)
#
# @param dbms_security_ldap_connection_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]]
#   The timeout for establishing an LDAP connection.
#   (Since 3.1)
#
# @param dbms_security_ldap_host [String] URL of LDAP server to use for
#   authentication and authorization.
#   (Since 3.1)
#
# @param dbms_security_ldap_read_timeout [Pattern[/[1-9][0-9]*(ms|s|m)?/]] The
#   timeout for an LDAP read request (i.e. search). A value of 0 means wait for
#   a response indefinitely.
#   (Since 3.1)
#
# @param dbms_security_ldap_referral [String] The LDAP referral behavior when
#   creating a connection.
#   (Since 3.1)
#
# @param dbms_security_ldap_use_starttls [Boolean] Use secure communication with
#    the LDAP server using opportunistic TLS.
#   (Since 3.1)
#
# @param dbms_security_log_successful_authentication [Boolean] Set to log
#   successful authentication events to the security log.
#   (Since 3.1)
#
# @param dbms_security_procedures_default_allowed [String] The default role that
#   can execute all procedures and user-defined functions that are not covered
#   by the dbms.security.procedures.roles setting.
#   (Since 3.1)
#
# @param dbms_security_procedures_roles [String] This provides a finer level of
#   control over which roles can execute procedures than the
#   dbms.security.procedures.default_allowed setting.
#   (Since 3.1)
#
# @param dbms_security_procedures_unrestricted [String] This provides a high level
#   control for procedures to run.
#   (Since 3.1)
#
# @param dbms_shell_enabled [Boolean] Enable a remote shell server which Neo4j
#   Shell clients can log in to.
#
# @param dbms_shell_host [String] Remote host for shell.
#
# @param dbms_shell_port [Integer[0,65535]] The port the shell will listen on.
#
# @param dbms_shell_read_only [Boolean] Read only mode.
#
# @param dbms_shell_rmi_name [String] The name of the shell.
#
# @param dbms_threads_worker_count [Integer[1,44738]] Number of Neo4j worker
#   threads, your OS might enforce a lower limit than the maximum value
#   specified here.
#
# @param dbms_transaction_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]] The maximum
#   time interval of a transaction within which it should be completed.
#
# @param dbms_tx_log_rotation_retention_policy [Variant[Boolean, Pattern[/[1-9][0-9]*[kKmMgG]? (size|txs)/]]
#   Make Neo4j keep the logical transaction logs for being able to backup the database.
#
# @param dbms_tx_log_rotation_size [Pattern[/[1-9][0-9]*[kKmMgG]?/]] Specifies
#   at which file size the logical log will auto-rotate.
#
# @param dbms_udc_enabled [Boolean] Enable the UDC extension.
#
# @param dbms_unmanaged_extension_classes [Pattern[/[a-z][a-z]*=[a-z][a-z]*/]]
#   Comma-separated list of <classname>=<mount point> for unmanaged extensions.
#
# @param dbms_windows_service_name
#
# @param default_file [Pattern[/((\/[a-z][a-z]*)?|[a-z][a-z]*)/]] File
#   containing environment variables.
#
# @param edition [Enum['community', 'enterprise']] Pick edition of neo4j.
#
# @param group [String] The group the neo4j user belongs to.
#
# @param ha_allow_init_cluster [Boolean] Whether to allow this instance to
#   create a cluster if unable to join.
#
# @param ha_branched_data_copying_strategy [Enum['branch_then_copy', 'copy_then_branch']]
#   Strategy for how to order handling of branched data on slaves and copying of
#   the store from the master.
#
# @param ha_branched_data_policy [Enum['keep_all', 'keep_last', 'keep_none']]
#   Policy for how to handle branched data.
#
# @param ha_broadcast_timeout [Pattern[/[1-9][0-9]*(ms|s|m)?/]] Timeout for
#   broadcasting values in cluster.
#
# @param ha_configuration_timeout [Pattern[/[1-9][0-9]*(ms|s|m)?/]] Timeout for
#   waiting for configuration from an existing cluster member during
#   cluster join.
#
# @param ha_data_chunk_size [Pattern[/[1-9][0-9]*[kKmMgG]?/]] Max size of the
#   data chunks that flows between master and slaves in HA.
#
# @param ha_default_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]] Default timeout
#   used for clustering timeouts.
#
# @param ha_election_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]] Timeout for
#   waiting for other members to finish a role election.
#
# @param ha_heartbeat_interval [Pattern[/[1-9][0-9]*(ms|s|m)/]] How often
#   heartbeat messages should be sent.
#
# @param ha_heartbeat_timeout [Pattern[/[1-9][0-9]*(ms|s|m)?/]] How long to wait
#   for heartbeats from other instances before marking them as suspects for failure.
#
# @param ha_host_coordination [Pattern[/[^:]+:[1-9][0-9]{4}/]] Host and port to
#   bind the cluster management communication.
#
# @param ha_host_data [Pattern[/[^:]+:[1-9][0-9]{4}/]] Hostname and port to bind
#   the HA server.
#
# @param ha_initial_hosts [Array[Pattern[/[^:]+:[1-9][0-9]{4}/]]] A
#   comma-separated list of other members of the cluster to join.
#   Mandatory: yes
#
# @param ha_internal_role_switch_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]]
#   Timeout for waiting for internal conditions during state switch, like for
#   transactions to complete, before switching to master or slave.
#
# @param ha_join_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]] Timeout for joining a
#   cluster.
#
# @param ha_learn_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]] Timeout for learning
#   values.
#
# @param ha_leave_timeout [Integer] Timeout for waiting for cluster leave to
#   finish.
#
# @param ha_max_acceptors [Integer[0]] Maximum number of servers to involve when
#   agreeing to membership changes.
#
# @param ha_max_channels_per_slave [Integer[1]] Maximum number of connections a
#   slave can have to the master.
#
# @param ha_paxos_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]] Default value for all
#   Paxos timeouts.
#
# @param ha_phase1_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]] Timeout for Paxos
#   phase 1.
#
# @param ha_phase2_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]] Timeout for Paxos
#   phase 2.
#
# @param ha_pull_batch_size [Integer] Size of batches of transactions applied on
#   slaves when pulling from master.
#
# @param ha_pull_interval [Pattern[/[1-9][0-9]*(ms|s|m)/]] Interval of pulling
#   updates from master.
#
# @param ha_role_switch_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]] Timeout for
#   request threads waiting for instance to become master or slave.
#
# @param ha_server_id [Integer] Id for a cluster instance.
#   Mandatory: yes
#
# @param ha_slave_lock_timeout [Pattern[/[1-9][0-9]*(ms|s|m)/]] Timeout for
#   taking remote (write) locks on slaves.
#
# @param ha_slave_only [Boolean] Whether this instance should only participate
#   as slave in cluster.
#
# @param ha_slave_read_timeout [Integer[0]] How long a slave will wait for
#   response from master before giving up.
#
# @param ha_tx_push_factor [Integer[0]] The amount of slaves the master will ask
#   to replicate a committed transaction.
#
# @param ha_tx_push_strategy [Enum['round_robin', 'fixed_descending', 'fixed_ascending']]
#   Push strategy of a transaction to a slave during commit.
#
# @param install_method [Enum['package', 'source']]
#
# @param install_prefix [Pattern[/\/([^/\0]+(\/)?)+/]] Determines the NEO4J_HOME.

#
# @param jmx_enable [Boolean] Enable remote JMX monitoring
#
# @param manage_repo [Boolean] Add neo4j repository as custom repository.
#
# @param metrics_bolt_messages_enabled [Boolean] Enable reporting metrics about
#   Bolt Protocol message processing.
#
# @param metrics_csv_enabled [Boolean] Set to true to enable exporting metrics
#   to CSV files.
#
# @param metrics_csv_interval [Pattern[/[1-9][0-9]*(ms|s|m)/]] The reporting
#   interval for the CSV files.
#
# @param metrics_csv_path [Pattern[/(\/)?([^/\0]+(\/)?)+/]] Directory path for
#   csv output files.
#
# @param metrics_cypher_replanning_enabled [Boolean] Enable reporting metrics
#   about number of occurred replanning events.
#
# @param metrics_enabled [Boolean] The default enablement value for all the
#   supported metrics.
#
# @param metrics_graphite_enabled [Boolean] Set to true to enable exporting
#   metrics to Graphite.
#
# @param metrics_graphite_interval [Pattern[/[1-9][0-9]*(ms|s|m)/]] The
#   reporting interval for Graphite.
#
# @param metrics_graphite_server [Pattern[/[^:]+:[1-9][0-9]{4}/]] The hostname
#   or IP address of the Graphite server.
#
# @param metrics_jvm_buffers_enabled [Boolean] Enable reporting metrics about
#   the buffer pools.
#
# @param metrics_jvm_gc_enabled [Boolean] Enable reporting metrics about the
#   duration of garbage collections.
#
# @param metrics_jvm_memory_enabled [Boolean] Enable reporting metrics about the
#   memory usage.
#
# @param metrics_jvm_threads_enabled [Boolean] Enable reporting metrics about
#   the current number of threads running.
#
# @param metrics_neo4j_causal_clustering_enabled [Boolean] Enable reporting
#   metrics about Causal Clustering mode.
#   (Since 3.1)
#
# @param metrics_neo4j_checkpointing_enabled [Boolean] Enable reporting metrics
#   about Neo4j check pointing.
#
# @param metrics_neo4j_cluster_enabled [Boolean] Enable reporting metrics about
#   HA cluster info.
#
# @param metrics_neo4j_counts_enabled [Boolean] Enable reporting metrics about
#   approximately how many entities are in the database.
#
# @param metrics_neo4j_enabled [Boolean] The default enablement value for all
#   Neo4j specific support metrics.
#
# @param metrics_neo4j_logrotation_enabled [Boolean] Enable reporting metrics
#   about the Neo4j log rotation.
#
# @param metrics_neo4j_network_enabled [Boolean] Enable reporting metrics about
#   the network usage.
#
# @param metrics_neo4j_pagecache_enabled [Boolean] Enable reporting metrics
#   about the Neo4j page cache.
#
# @param metrics_neo4j_server_enabled [Boolean] Enable reporting metrics about
#   Server threading info.
#
# @param metrics_neo4j_tx_enabled [Boolean] Enable reporting metrics about
#   transactions.
#
# @param metrics_prefix [String] A common prefix for the reported metrics field
#   names.
#
# @param release_deb [String] The name of the debian release to use, only used
#   when manage_repo is true.
#
# @param release_rpm [String] The name of the rpm release to use, only used when
#   manage_repo is true.
#
# @param service_enable [Boolean] Manage neo4j service.
#
# @param service_ensure [Variant[Booolean, Enum['stopped', 'running']]] Whether
#   the service should be running.
#
# @param service_name [String] The name of the service to run.
#
# @param service_provider [Enum['debian', 'redhat', 'systemd', 'init']] The
#   puppet service provider.
#
# @param service_ulimit [Integer] Maximum number of open file descriptors.
#
# @param service_shutdown_timeout [Integer] Number of seconds to wait for
#   shutdown before killing the process.
#
# @param tools_consistency_checker_check_graph [Boolean] Perform checks between
#   nodes, relationships, properties, types and tokens_
#
# @param tools_consistency_checker_check_indexes [Boolean] Perform checks on
#   indexes.
#
# @param tools_consistency_checker_check_label_scan_store [Boolean] Perform
#   checks on the label scan store.
#
# @param tools_consistency_checker_check_property_owners [Boolean] Perform
#   optional additional checking on property ownership.
#
# @param unsupported_dbms_security_ldap_authorization_connection_pooling [Boolean]
#   Set to true if connection pooling should be used for authorization searches
#   using the system account.
#
# @param user [String] The user which runs the neo4j service.
#
# @param version [String] The version of the neo4 package.
#
# @param allow_load_csv [Boolean] Allow set dbms_directories_import directory
#   in neo4j.conf.general.erb
#
class neo4j (
  $data_prefix                                                       = $::neo4j::params::data_prefix,
  $edition                                                           = $::neo4j::params::edition,
  $group                                                             = $::neo4j::params::group,
  $install_prefix                                                    = $::neo4j::params::install_prefix,
  $install_method                                                    = $::neo4j::params::install_method,
  $jmx_enable                                                        = $::neo4j::params::jmx_enable,
  $manage_repo                                                       = $::neo4j::params::manage_repo,
  $release_deb                                                       = $::neo4j::params::release_deb,
  $release_rpm                                                       = $::neo4j::params::release_rpm,
  $service_enable                                                    = $::neo4j::params::service_enable,
  $service_ensure                                                    = $::neo4j::params::service_ensure,
  $service_name                                                      = $::neo4j::params::service_name,
  $service_provider                                                  = $::neo4j::params::service_provider,
  $user                                                              = $::neo4j::params::user,
  $version                                                           = $::neo4j::params::version,
  $allow_load_csv                                                    = $::neo4j::allow_load_csv,
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
  $dbms_security_procedures_unrestricted                             = $::neo4j::params::dbms_security_procedures_unrestricted,
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
  validate_absolute_path( [
    $data_prefix,
    $install_prefix
  ] )

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
    $allow_load_csv,
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

  ### validate service provider
  validate_re( $service_provider, 'debian|init|redhat|systemd' )

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
    $dbms_security_procedures_unrestricted,
    $dbms_shell_host,
    $dbms_shell_rmi_name,
    $dbms_tx_log_rotation_retention_policy,
    $edition,
    $group,
    $ha_tx_push_strategy,
    $install_method,
    $metrics_prefix,
    $release_deb,
    $release_rpm,
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
      $config_dir = '/etc/neo4j'
    }
    'archive': {
      if ( versioncmp( $version, '3.0.0' ) < 0 ) {
        fail('Only versions >= 3.0.0 are supported at this time.')
      }
      $neo4j_home = "${install_prefix}/${source_name}"
      $config_dir = "${neo4j_home}/conf"
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

  anchor { 'neo4j::begin': }
  -> class{'::neo4j::install':}
  -> class{'::neo4j::config':}
  ~> class{'::neo4j::service':}
  -> anchor { 'neo4j::end': }
}
