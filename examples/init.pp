# The baseline test for the neo4j module
case $::osfamily {
  'RedHat': {
    $package_name = 'java-1.8.0-openjdk'
  }
  'Debian': {
    Class['apt::update'] -> Package <| |>
    case $::operatingsystemrelease {
      /^7\..*/ : {
        $package_name = 'oracle-java8-installer'
        apt::source { 'webupd8team':
          location => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
          release  => 'precise',
          repos    => 'main',
          key      => {
            'id'     => 'C2518248EEA14886',
            'server' => 'keyserver.ubuntu.com',
          },
        }

        exec {'accept-license':
          command => '/bin/echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections'
        }

        Apt::Source['webupd8team'] -> Package['java']
        Exec['accept-license'] -> Package['java']
      }
      /^8\..*/ : {
        $package_name = 'openjdk-8-jdk'

        apt::source { 'jessie-backports':
          location => 'http://httpredir.debian.org/debian',
          release  => 'jessie-backports',
          repos    => 'main',
          key      => {
            'id'     => 'C2518248EEA14886',
            'server' => 'pgpkeys.mit.edu',
          },
        }

        Apt::Source['jessie-backports'] -> Package['java']
      }
      /^14\.04.*/ : {
        $package_name = 'oracle-java8-installer'

        apt::source { 'webupd8team':
          location => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
          release  => 'trusty',
          repos    => 'main',
          key      => {
            'id'     => 'C2518248EEA14886',
            'server' => 'keyserver.ubuntu.com',
          },
        }

        exec {'accept-license':
          command => '/bin/echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections'
        }

        Apt::Source['webupd8team'] -> Package['java']
        Exec['accept-license'] -> Package['java']
      }
      default : {
        $package_name = 'openjdk-8-jdk'
      }
    }
  }
  default: {
    fail( "Unsupported OS family: ${::osfamily}" )
  }
}

class { '::java':
  distribution => 'jdk',
  package      => $package_name
}

class { '::neo4j' :
  manage_repo  => true,
}

Class['java'] -> Service['neo4j']
