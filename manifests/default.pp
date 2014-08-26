####
#
# General purpose puppet file
#

# Required packages
$requiredPackages = [
  'apache2',
  'mysql-server',
  'mysql-client',
]
package { $requiredPackages:
  ensure => latest,
}

# Extra packages that make me happy
$extraPackages = [
  'vim',
]
package { $extraPackages:
  ensure => latest,
}

# Packages that need to notify apache2
$notifyApache2Packages = [
  'libapache2-mod-php5',
  'php5-mysql',
  'php5-mcrypt',
  'php5-curl',
  'php5-gd',
]
package { $notifyApache2Packages:
  ensure => latest,
  notify => Service['apache2'],
}

# Apache Stuff
service { 'apache2':
  ensure  => running,
  require => Package['apache2'],
}
$vhost = "
<VirtualHost *:80>
  ServerName www.localhost.com
  DocumentRoot /var/www/woocommerce/web
  <Directory /var/www/woocommerce/web>
    AllowOverride All
  </Directory>
</VirtualHost>
"
file { '/etc/apache2/sites-available/000-default.conf':
  ensure  => present,
  content => "$vhost",
  notify  => Service['apache2'],
}

# MySQL stuff
service { 'mysql':
  ensure  => running,
  require => Package['mysql-server'],
}
