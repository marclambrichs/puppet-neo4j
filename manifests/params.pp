# == Class: neo4j::params
#
class neo4j::params {
  $address                           = $::ipaddress
  $allow_remote_connections          = true
  $auth_admin_user                   = undef
  $auth_admin_password               = undef
  $auth_enabled                      = true
  $auth_users                        = undef
  $cache_type                        = undef
  $cache_memory_ratio                = undef
  $edition                           = 'community'
  $group                             = 'neo4j'
  $ha_enabled                        = false
  $ha_server_id                      = undef
  $ha_cluster_port                   = '5001'
  $ha_data_port                      = '6001'
  $ha_pull_interval                  = undef
  $ha_tx_push_factor                 = undef
  $ha_tx_push_strategy               = undef
  $ha_allow_init_cluster             = true
  $ha_slave_only                     = false
  $http_port                         = 7474
  $http_log_enabled                  = false
  $https_enabled                     = true
  $https_port                        = 7475
  $install_prefix                    = '/opt/neo4j'
  $jvm_init_memory                   = '1024'
  $jvm_max_memory                    = '1024'
  $keep_logical_logs                 = '7 days'
  $keystore_location                 = 'keystore'
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
  $rrdb_location                     = 'rrd'
  $service_enable                    = true
  $service_ensure                    = running
  $tls_certificate_file              = 'conf/ssl/snakeoil.cert'
  $tls_key_file                      = 'conf/ssl/snakeoil.key'
  $user                              = 'neo4j'
  $version                           = '2.3.6'

  if ! member( ['community','enterprise'], $edition ){
    fail('$edition should be one of [\'community\',\'enterprise\']')
  }
}
