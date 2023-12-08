# Creates a custom HTTP header response with Puppet.
exec { 'command':
  command  => 'sudo apt-get update;
  sudo apt-get -y install nginx;
  sudo sed -i "/server_name _;/a \\n\tadd_header X-Served-By $hostname;" /etc/nginx/sites-available/default;
  sudo service nginx restart',
  provider => shell,
}
