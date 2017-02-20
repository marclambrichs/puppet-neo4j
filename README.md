# neo4j puppet module

[![Puppet Forge](http://img.shields.io/puppetforge/v/mlambrichs/neo4j.svg)](https://forge.puppetlabs.com/mlambrichs/neo4j) [![Build Status](https://travis-ci.org/mlambrichs/puppet-neo4j.svg?branch=master)](https://travis-ci.org/mlambrichs/puppet-neo4j)

=====================

####Table of Contents

1. [Overview](#overview)
1. [Setup](#setup)
1. [Usage](#usage)
1. [Development](#development)

## Overview

Installs Neo4J (http://www.neo4j.com) on CentOS/RedHat/Ubuntu/Debian either from packages or from their distribution tarballs downloaded directly from the Neo4j website.

## Setup

All of the setup for any of the configuration is done through via class `neo4j`.  There are default options
provided such that you can install Neo4j into `/opt/neo4j` and start listening on `http://your_ip:7474/` by specifying:

```puppet
include neo4j
```

To install the last enterprise edition, you can specify:

```puppet
class { 'neo4j' :
  edition => 'enterprise',
}
```

See [usage](#usage) scenarios below for further usages.

## Usage

Currently, all of the configuration is done through the class `neo4j` including clustered Neo4j server.

Here are some examples of different configurations that people could use this module to manage their Neo4j instances.

### Install from source
```puppet
class { 'neo4j' :
  install_method => 'archive'
}
```

### Install from package
```puppet
class { 'neo4j' :
}
```
### Authentication and User Management
For information on what native roles are provided, creating and deleting custom roles,
ldap config management, see https://neo4j.com/docs/operations-manual/current/security/authentication-authorization/.

### Clustering

Starting from Neo4j version 3.1, causal clustering is enabled. HA clustering is still available, but - according my Neo4J's deep throat - it will become deprecated in future versions. So, if you're using the latest and greatest: go for Causal Clustering.

#### HA Clustering (>3.0)

##### Parameters available:

- ha_allow_init_cluster				# Whether to allow this instance to create a cluster if unable to join.
- ha_branched_data_copying_strategy # Strategy for how to order handling of branched data on slaves and copying of the store from the master.
- ha_branched_data_policy			# Policy for how to handle branched data.
- ha_broadcast_timeout				# Timeout for broadcasting values in cluster.
- ha_configuration_timeout			# Timeout for waiting for configuration from an existing cluster member during cluster join.
- ha_data_chunk_size				# Max size of the data chunks that flows between master and slaves in HA.
- ha_default_timeout				# Default timeout used for clustering timeouts.
- ha_election_timeout				# Timeout for waiting for other members to finish a role election.
- ha_heartbeat_interval				# How often heartbeat messages should be sent.
- ha_heartbeat_timeout				# How long to wait for heartbeats from other instances before marking them as suspects for failure.
- ha_host_coordination				# Host and port to bind the cluster management communication.
- ha_host_data						# Hostname and port to bind the HA server.
- ha_initial_hosts					# A comma-separated list of other members of the cluster to join.
- ha_internal_role_switch_timeout	# Timeout for waiting for internal conditions during state switch, like for transactions to complete, before switching to master or slave.
- ha_join_timeout					# Timeout for joining a cluster.
- ha_learn_timeout					# Timeout for learning values.
- ha_leave_timeout					# Timeout for waiting for cluster leave to finish.
- ha_max_acceptors					# Maximum number of servers to involve when agreeing to membership changes.
- ha_max_channels_per_slave			# Maximum number of connections a slave can have to the master.
- ha_paxos_timeout					# Default value for all Paxos timeouts.
- ha_phase1_timeout					# Timeout for Paxos phase 1.
- ha_phase2_timeout					# Timeout for Paxos phase 2.
- ha_pull_batch_size				# Size of batches of transactions applied onslaves when pulling from master.
- ha_pull_interval					# Interval of pulling updates from master.
- ha_role_switch_timeout			# Timeout for request threads waiting for instance to become master or slave.
- ha_server_id						# Id for a cluster instance.
- ha_slave_lock_timeout				# Timeout for taking remote (write) locks on slaves.
- ha_slave_only						# Whether this instance should only participate as slave in cluster.
- ha_slave_read_timeout				# How long a slave will wait for response from master before giving up
- ha_tx_push_factor					# The amount of slaves the master will ask to replicate a committed transaction.
- ha_tx_push_strategy				# Push strategy of a transaction to a slave during commit.


#### Causal Clustering (3.1, 3.2)

##### Parameters available:

- causal_clustering_array_block_id_allocation_size					# The size of the ID allocation requests Core servers will make when they run out of ARRAY_BLOCK IDs.
- causal_clustering_catchup_batch_size								# The maximum batch size when catching up (in unit of entries).
- causal_clustering_cluster_allow_reads_on_followers				# Configure if the dbms.cluster.routing.getServers() procedure should include followers as read endpoints or return only read replicas.
- causal_clustering_cluster_routing_ttl								# How long drivers should cache the data from the dbms.cluster.routing.getServers() procedure.
- causal_clustering_cluster_topology_refresh						# Time between scanning the cluster to refresh current server’s view of topology.
- causal_clustering_disable_middleware_logging						# Prevents the network middleware from dumping its own logs.
- causal_clustering_discovery_advertised_address					# Advertised cluster member discovery management communication.
- causal_clustering_discovery_listen_address						# Host and port to bind the cluster member discovery management communication.
- causal_clustering_expected_core_cluster_size						# Expected number of Core machines in the cluster.
- causal_clustering_global_session_tracker_state_size				# The maximum file size before the global session tracker state file is rotated (in unit of entries).
- causal_clustering_id_alloc_state_size								# The maximum file size before the ID allocation file is rotated (in unit of entries).
- causal_clustering_initial_discovery_members						# A comma-separated list of other members of the cluster to join.
- causal_clustering_join_catch_up_timeout							# Time out for a new member to catch up.
- causal_clustering_label_token_id_allocation_size					# The size of the ID allocation requests Core servers will make when they run out of LABEL_TOKEN IDs.
- causal_clustering_label_token_name_id_allocation_size				# The size of the ID allocation requests Core servers will make when they run out of LABEL_TOKEN_NAME IDs.
- causal_clustering_last_applied_state_size							# The maximum file size before the storage file is rotated (in unit of entries).
- causal_clustering_leader_election_timeout							# The time limit within which a new leader election will occur if no messages are received.
- causal_clustering_log_shipping_max_lag							# The maximum lag allowed before log shipping pauses (in unit of entries).
- causal_clustering_neostore_block_id_allocation_size				# The size of the ID allocation requests Core servers will make when they run out of NEOSTORE_BLOCK IDs.
- causal_clustering_node_id_allocation_size							# The size of the ID allocation requests Core servers will make when they run out of NODE IDs.
- causal_clustering_node_labels_id_allocation_size					# The size of the ID allocation requests Core servers will make when they run out of NODE_LABELS IDs.
- causal_clustering_outgoing_queue_size								# The number of messages waiting to be sent to other servers in the cluster.
- causal_clustering_property_id_allocation_size						# The size of the ID allocation requests Core servers will make when they run out of PROPERTY IDs.
- causal_clustering_property_key_token_id_allocation_size			# The size of the ID allocation requests Core servers will make when they run out of PROPERTY_KEY_TOKEN IDs.
- causal_clustering_property_key_token_name_id_allocation_size		# The size of the ID allocation requests Core servers will make when they run out of PROPERTY_KEY_TOKEN_NAME IDs.
- causal_clustering_pull_interval									# Interval of pulling updates from cores.
- causal_clustering_raft_advertised_address							# Advertised hostname/IP address and port for the RAFT server.
- causal_clustering_raft_listen_address								# Network interface and port for the RAFT server to listen on.
- causal_clustering_raft_log_implementation							# RAFT log implementation.
- causal_clustering_raft_log_prune_strategy							# RAFT log pruning strategy.
- causal_clustering_raft_log_pruning_frequency						# RAFT log pruning frequency.
- causal_clustering_raft_log_reader_pool_size						# RAFT log reader pool size.
- causal_clustering_raft_log_rotation_size							# RAFT log rotation size.
- causal_clustering_raft_membership_state_size						# The maximum file size before the membership state file is rotated (in unit of entries).
- causal_clustering_raft_messages_log_enable						# Enable or disable the dump of all network messages pertaining to the RAFT protocol.
- causal_clustering_raft_term_state_size							# The maximum file size before the term state file is rotated (in unit of entries).
- causal_clustering_raft_vote_state_size							# The maximum file size before the vote state file is rotated (in unit of entries).
- causal_clustering_read_replica_refresh_rate						# Read replica 'call home' frequency.
- causal_clustering_read_replica_time_to_live						# Time To Live before read replica is considered unavailable.
- causal_clustering_relationship_group_id_allocation_size			# The size of the ID allocation requests Core servers will make when they run out of RELATIONSHIP_GROUP IDs.
- causal_clustering_relationship_id_allocation_size					# The size of the ID allocation requests Core servers will make when they run out of RELATIONSHIP IDs.
- causal_clustering_relationship_type_token_id_allocation_size		# The size of the ID allocation requests Core servers will make when they run out of RELATIONSHIP_TYPE_TOKEN IDs.
- causal_clustering_relationship_type_token_name_id_allocation_size # The size of the ID allocation requests Core servers will make when they run out of RELATIONSHIP_TYPE_TOKEN_NAME IDs.
- causal_clustering_replicated_lock_token_state_size				# The maximum file size before the replicated lock token state file is rotated (in unit of entries).
- causal_clustering_schema_id_allocation_size						# The size of the ID allocation requests Core servers will make when they run out of SCHEMA IDs.
- causal_clustering_state_machine_apply_max_batch_size				# The maximum number of operations to be batched during applications of operations in the state machines.
- causal_clustering_state_machine_flush_window_size					# The number of operations to be processed before the state machines flush to disk.
- causal_clustering_string_block_id_allocation_size					# The size of the ID allocation requests Core servers will make when they run out of STRING_BLOCK IDs.
- causal_clustering_transaction_advertised_address					# Advertised hostname/IP address and port for the transaction shipping server.
- causal_clustering_transaction_listen_address						# Network interface and port for the transaction shipping server to listen on.
- causal_clustering_unknown_address_logging_throttle				# Throttle limit for logging unknown cluster member address.

### Install Path

If you want to install to another directory, use the `install_prefix` parameter.
```puppet
class { 'neo4j' :
  install_prefix => '/tmp',
}
```

### Graphite
You can specifiy to send several metrics to a a graphite server.

- metrics_enabled			 # enable all supported metrics
- metrics_graphite_enabled	 # enable sending metrics to graphite
- metrics_graphite_interval	 # Set the graphite interval. Defaults to 3 min.
- metrics_graphite_server	 # Set the graphite server.
- metrics_prefix			 # set the prefix so you can find your metrics in graphite.

Enable/disable specific metrics:

- metrics_jvm_buffers_enabled
- metrics_jvm_gc_enabled
- metrics_jvm_memory_enabled
- metrics_jvm_threads_enabled
- metrics_neo4j_causal_clustering_enabled
- metrics_neo4j_checkpointing_enabled
- metrics_neo4j_cluster_enabled
- metrics_neo4j_counts_enabled
- metrics_neo4j_enabled
- metrics_neo4j_logrotation_enabled
- metrics_neo4j_network_enabled
- metrics_neo4j_pagecache_enabled
- metrics_neo4j_server_enabled
- metrics_neo4j_tx_enabled

### Memory Tuning

#### Tuning of the page cache size
For caching the neo4j data as stored on disk in memory, sum up the size of all store.db files
on disk and add 20% for growth.

- dbms_memory_pagecache_size

#### Tuning of the heap size
- dbms_memory_heap_initial_size
- dbms_memory_heap_max_size

#### JVM tuning properties

- dbms_jvm_additional_use_g1gc
- dbms_jvm_additional_omit_stacktrace_in_fast_throw
- dbms_jvm_additional_hashcode
- dbms_jvm_additional_commit_memory_to_process
- dbms_jvm_additional_unlock_experimental_vm_options
- dbms_jvm_additional_trust_final_non_static_fields
- dbms_jvm_additional_disable_explicit_gc

```puppet
class { 'neo4j' :
  dbms_memory_heap_initial_size => '4g',
  dbms_memroy_heap_max_size     => '4g',
  dbms_memory_pagecache_size    => '4g',
}
```

### Versions
All known versions >= 3.0.0 can be installed.  For the list of current releases, you can go to http://neo4j.com/download/.
```puppet
class { 'neo4j' :
  version => '3.1.0',
  edition => 'enterprise',
}
```

## Development

### Running tests

This project contains tests for both rspec-puppet and test kitchen to verify functionality. For detailed information on using these tools, please see their respective documentation.

#### Testing quickstart:

```
gem install bundler
bundle install
bundle exec rake {validate,lint,spec,strings:generate,guard}
bundle exec kitchen {list,converge,verify,test}
