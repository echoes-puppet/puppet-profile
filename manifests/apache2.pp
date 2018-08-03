class profile::apache2(
  Boolean $default_vhost = false,
  Integer $port          = 80,
  String $docroot        = "/var/www/${facts['fqdn']}",
) {
  class { '::apache':
    default_vhost => $default_vhost,
  }

  ::apache::vhost { "${facts['fqdn']}":
    before  => File["${docroot}/index.html"],
    port    => $port,
    docroot => $docroot,
  }
  file { "${docroot}/index.html":
    content => "Test page. This is a test page",
  }
}
