class profile::apache(
  Boolean $default_vhost = false,
  Integer $port          = 80,
  String $docroot        = '/var/www/ja2first',
) {
  class { '::apache':
    default_vhost => $default_vhost,
  }

  ::apache::vhost { 'ja4.mylabserver.com':
    port    => $port,
    docroot => $docroot,
  }
}
