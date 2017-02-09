# == Class: neo4j::install
#
# Installs Neo4J (http://www.neo4j.com) on RHEL/Ubuntu/Debian from their
# distribution tarballs downloaded directly from their site.
#
#
# === Authors
#
# Marc Lambrichs <marc.lambrichs@gmail.com>
#
# === Copyright
#
# Copyright 2016-2017 Marc Lambrichs, unless otherwise noted.
#
class neo4j::install (
  $data_dir              = $::neo4j::data_dir,
  $group                 = $::neo4j::group,
  $install_method        = $::neo4j::install_method,
  $install_prefix        = $::neo4j::install_prefix,
  $logs_dir              = $::neo4j::logs_dir,
  $manage_repo           = $::neo4j::manage_repo,
  $neo4j_home            = $::neo4j::neo4j_home,
  $package_name          = $::neo4j::package_name,
  $source_tarball        = $::neo4j::source_tarball,
  $source_name           = $::neo4j::source_name,
  $user                  = $::neo4j::user,
  $version               = $::neo4j::version,
  ){

  ## define the user and group the neo4j service will be running.
  group { $group:
    ensure => present
  } ->
  user { $user:
    ensure => present,
    gid    => $group,
    shell  => '/bin/bash',
    home   => $neo4j_home
  }

  case $install_method {
    'package': {
      if $manage_repo {
        case $::osfamily {
          'RedHat': {
            yumrepo {'neo4j':
              descr    => 'Neo4j Yum Repo',
              baseurl  => 'http://yum.neo4j.org',
              gpgcheck => 1,
              gpgkey   => 'http://debian.neo4j.org/neotechnology.gpg.key',
              enabled  => 1,
            }
            Yumrepo['neo4j'] -> Package['neo4j']
          }
          'Debian': {
            apt::source { 'neo4j':
              location => 'http://debian.neo4j.org/repo',
              release  => 'stable/',
              repos    => '',
              key      => {
                'id'     => '66D34E951A8C53D90242132B26C95CF201182252',
                'server' => 'pgp.mit.edu',
                'source' => 'http://debian.neo4j.org/neotechnology.gpg.key',
              },
            }
            Apt::Source['neo4j'] -> Package['neo4j']
          }
          default: {
            fail( "Unsupported OS family: ${::osfamily}" )
          }
        }
      }
      package { 'neo4j':
        ensure => $version,
        name   => $package_name,
      } ->

      file { $data_dir:
        ensure => directory,
        owner  => $user,
        group  => $group,
      }
    }
    'archive': {

      if (! defined(Package['lsof'])) and ( versioncmp( $version, '3.1.0' ) < 0 )  {
        package { 'lsof' :
          before => Service['neo4j']
        }
      }

      file { $install_prefix:
        ensure => directory,
      }

      file { $neo4j_home:
        ensure  => directory,
        owner   => $user,
        group   => $group,
        mode    => '0755',
        require => [User[$user], Group[$group]]
      }

      archive { $source_tarball:
        ensure       => present,
        cleanup      => false,
        extract      => true,
        extract_path => $install_prefix,
        path         => "/tmp/${source_tarball}",
        filename     => $source_tarball,
        source       => "https://neo4j.com/artifact.php?name=${source_name}-unix.tar.gz",
        user         => $user,
        group        => $group,
        creates      => "${neo4j_home}/bin",
        require      => File[$neo4j_home],
      }
    }
    default: {
      fail("Installation method ${install_method} not supported.")
    }
  }
}
