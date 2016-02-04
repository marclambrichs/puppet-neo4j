# == Class: neo4j::params
#
class neo4j::params {
  $address                           = $::ipaddress
  $allow_remote_connections          = true
  $auth_ensure                       = absent
  $auth_admin_user                   = undef
  $auth_admin_password               = undef
  $auth_users                        = undef
  $cache_type                        = undef
  $cache_memory_ratio                = undef
  $edition                           = 'community'
  $ha_ensure                         = absent
  $ha_server_id                      = undef
  $ha_cluster_port                   = '5001'
  $ha_data_port                      = '6001'
  $ha_pull_interval                  = undef
  $ha_tx_push_factor                 = undef
  $ha_tx_push_strategy               = undef
  $ha_allow_init_cluster             = true
  $ha_slave_only                     = false
  $install_prefix                    = '/opt/neo4j'
  $jvm_init_memory                   = '1024'
  $jvm_max_memory                    = '1024'
  $keep_logical_logs                 = '7 days'
  $newrelic_jar_path                 = undef
  $node_cache_array_fraction         = undef
  $node_cache_size                   = undef
  $nodestore_memory                  = undef
  $propertystore_arrays_memory       = undef
  $propertystore_memory              = undef
  $propertystore_strings_memory      = undef
  $relationship_cache_array_fraction = undef
  $relationship_cache_size           = undef
  $relationshipstore_memory          = undef
  $service_enable                    = true
  $service_ensure                    = running
  $version                           = '2.1.2'
}
