# The baseline test for the neo4j module
class { '::java':
  distribution => 'jdk',
  package      => 'java-1.8.0-openjdk'
} ->
class { '::neo4j' :
  dbms_mode      => 'SINGLE',
  install_method => 'archive',
}
