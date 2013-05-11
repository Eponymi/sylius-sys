name             'symfony2'
maintainer       'Dylan Johnson'
maintainer_email 'dylandevelopment@gmail.com'
license          'All rights reserved'
description      'Installs/Configures a Symfony2 application'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

depends "apache2"
depends "jolicode-php"
depends "priestjim-php"
depends "mysql"
depends "database"
depends 'swap'

supports 'ubuntu', ">= 12.10"