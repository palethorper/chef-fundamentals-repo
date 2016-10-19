name             'email_handler'
maintainer       'Dimension Data'
maintainer_email 'Mark.Greenwood@itaas.dimensiondata.com'
license          'All rights reserved'
description      'Installs/Configures email_handler'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "mailx"
depends "postfix"
depends "chef_handler"