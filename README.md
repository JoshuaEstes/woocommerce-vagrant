joshuaestes/woocommerce-vagrant
===============================

Vagrant machine that I have created to install and develop the woocommerce
plugin for BitPay. All the commands needed can be done using phing targets.

# Requirements

* [Virtual Box](https://www.virtualbox.org/)
* [Vagrant](http://www.vagrantup.com/)

# Install

```bash
git clone https://github.com/JoshuaEstes/woocommerce-vagrant.git
cd woocommerce-vagrant
curl -sS https://getcomposer.org/installer | php
php composer.phar install
vagrant up
php bin/phing wp:core:download wp:core:config vagrant:wp:core:install vagrant:wp:plugin:install
```

# Configure

You should be able to do all the configuration from the build.properties file
that can be found in the build directory.
