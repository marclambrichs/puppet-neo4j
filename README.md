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

#### HA Clustering (3.0, 3.1)

#### Causal Clustering (3.2)

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
