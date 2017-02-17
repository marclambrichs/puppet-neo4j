# The baseline test for the neo4j module
case $::osfamily {
  'RedHat': {
    $group = 'root'
    $package_name = 'java-1.8.0-openjdk'
    $package_options = undef
  }
  'Debian': {
    Class['apt::update'] -> Package <| |>
    case $::operatingsystemrelease {
      /^7\..*/ : {
        $group = 'adm'
        $package_name = 'oracle-java8-installer'
        $package_options = undef

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
        $group = 'adm'
        $package_name = 'openjdk-8-jdk'
        $package_options = ['-t', 'jessie-backports']

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
        $group = 'adm'
        $package_name = 'oracle-java8-installer'
        $package_options = undef

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
        $group = 'root'
        $package_name = 'openjdk-8-jdk'
        $package_options = undef
      }
    }
  }
  default: {
    fail( "Unsupported OS family: ${::osfamily}" )
  }
}

class { '::java':
  distribution    => 'jdk',
  package         => $package_name,
  package_options => $package_options,
}

class { '::neo4j' :
  group          => $group,
  install_method => 'archive',
  version        => '3.2.0-alpha04',
}

Class['java'] -> Service['neo4j']
