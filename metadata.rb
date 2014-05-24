name             'acms'
maintainer       'ogom'
maintainer_email 'ogom@hotmail.co.jp'
license          'MIT'
description      'Installs/Configures acms'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ apache2 mysql php apt database }.each do |dep|
  depends dep
end

%w{ debian ubuntu }.each do |os|
  supports os
end
