# == Define: user
#
# An initial_host of the Neo4j ha cluster.
#
#  **Note: This is an internal class and should not be called directly.
#
# === Parameters
#
# === Authors
#
# Marc Lambrichs <marc.lambrichs@gmail.com>
#
# === Copyright
#
# Copyright 2016 Marc Lambrichs, unless otherwise noted.
#
define neo4j::initial_host (
  $ip,
  $ha_cluster_name,
  $ha_cluster_port = 5001
) {
  $fragment_file = $::neo4j::properties_file

  concat::fragment{ "${title} fragment ":
    target  => $fragment_file,
    content => "${ip}:${ha_cluster_port},",
    order   => 10
  }
}
