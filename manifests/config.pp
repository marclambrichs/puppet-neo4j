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
class neo4j::config ()
{

  File {
    ensure  => file,
    mode    => '0600',
    before  => Service['neo4j'],
    notify  => Service['neo4j'],
  }

  # Track the configuration files
  file { 'neo4j-server.properties':
    path    => "${neo4j::neo4j_home}/conf/neo4j-server.properties",
    content => template('neo4j/neo4j-server.properties.erb'),
  }

  file { 'neo4j-http-logging.xml':
    path    => "${neo4j::neo4j_home}/conf/neo4j-http-logging.xml",
    content => template('neo4j/neo4j-http-logging.xml.erb'),
  }

  $properties_file = "${neo4j::neo4j_home}/conf/neo4j.properties"

  concat { $properties_file :
    owner  => $neo4j::user,
    group  => $neo4j::group,
    mode   => '0644',
    before => Service['neo4j'],
    notify => Service['neo4j'],
  }

  $cache_type                        = $neo4j::cache_type
  $cache_memory_ratio                = $neo4j::cache_memory_ratio
  $ha_allow_init_cluster             = $neo4j::ha_allow_init_cluster
  $ha_cluster_port                   = $neo4j::ha_cluster_port
  $ha_data_port                      = $neo4j::ha_data_port
  $ha_ensure                         = $neo4j::ha_ensure
  $ha_server_id                      = $neo4j::ha_server_id
  $ha_pull_interval                  = $neo4j::ha_pull_interval
  $ha_slave_only                     = $neo4j::ha_slave_only
  $ha_tx_push_factor                 = $neo4j::ha_tx_push_factor
  $ha_tx_push_strategy               = $neo4j::ha_tx_push_strategy
  $ipaddress                         = $neo4j::ipaddress
  $keep_logical_logs                 = $neo4j::keep_logical_logs
  $node_cache_array_fraction         = $neo4j::node_cache_array_fraction
  $node_cache_size                   = $neo4j::node_cache_size
  $nodestore_memory                  = $neo4j::nodestore_memory
  $propertystore_arrays_memory       = $neo4j::propertystore_arrays_memory
  $propertystore_memory              = $neo4j::propertystore_memory
  $propertystore_strings_memory      = $neo4j::propertystore_strings_memory
  $relationship_cache_array_fraction = $neo4j::relationship_cache_array_fraction
  $relationship_cache_size           = $neo4j::relationship_cache_size
  $relationship_memory               = $neo4j::relationship_memory
  $version                           = $neo4j::version

  concat::fragment{ 'neo4j properties header':
    target  => $properties_file,
    content => template('neo4j/neo4j.properties.concat.1.erb'),
    order   => 01,
  }

  concat::fragment{ 'neo4j properties ha_initial_hosts':
    target  => $properties_file,
    content => 'ha.initial_hosts=',
    order   => 02,
  }

  concat::fragment{ 'neo4j properties footer':
    target  => $properties_file,
    content => "\n\n#End of file\n",
    order   => 99,
  }

  $jvm_init_memory   = $neo4j::jvm_init_memory
  $jvm_max_memory    = $neo4j::jvm_max_memory
  $newrelic_jar_path = $neo4j::newrelic_jar_path

  file { 'neo4j-wrapper.conf':
    path    => "${neo4j::neo4j_home}/conf/neo4j-wrapper.conf",
    content => template('neo4j/neo4j-wrapper.conf.erb'),
  }
}
