# == Class: neo4j::logging
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
class neo4j::logging ()
{
  file { 'neo4j-http-logging.xml':
    ensure  => file,
    path    => "${neo4j::install_prefix}/${neo4j::package_name}/conf/neo4j-http-logging.xml",
    content => template('neo4j/neo4j-http-logging.xml.erb'),
    mode    => '0600',
    before  => Service['neo4j'],
    notify  => Service['neo4j'],
  }
}
