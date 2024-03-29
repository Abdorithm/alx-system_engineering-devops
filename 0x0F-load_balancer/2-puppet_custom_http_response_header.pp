# Installs a Nginx server with custom HTTP header

exec {'update':
  provider => shell,
  command  => 'sudo apt-get -y update',
  before   => Exec['install Nginx'],
}

exec {'install Nginx':
  provider => shell,
  command  => 'sudo apt-get -y install nginx',
  before   => Exec['add_header'],
}

exec { 'add_header':
  provider => shell,
  command  => 'sudo sed -i "/server_name _;/a \\n\tadd_header X-Served-By $hostname;" /etc/nginx/sites-available/default',
  before   => Exec['restart Nginx'],
}

exec { 'restart Nginx':
  provider => shell,
  command  => 'sudo service nginx restart',
}
