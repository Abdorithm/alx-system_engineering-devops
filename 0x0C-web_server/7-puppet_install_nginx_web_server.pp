# Configure a server

exec { 'update and install nginx':
  command => 'apt-get update && apt-get -y install nginx',
  path    => '/usr/bin',
}

file { 'var/www/html/index.nginx-debian.html':
  ensure  => file,
  content => 'Hello World!',
}

exec { 'redirect':
  command => "sed -i '/server_name _;/a \\n\tlocation /redirect_me {\n\t\treturn 301 https://x.com/Abdorithm;\n\t}' /etc/nginx/sites-available/default",
  path    => '/usr/bin',
}
