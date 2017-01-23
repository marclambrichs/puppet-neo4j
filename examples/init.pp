# The baseline test for the neo4j module
class { '::neo4j' :
  dbms_mode      => 'SINGLE',
  install_method => 'archive',
}
