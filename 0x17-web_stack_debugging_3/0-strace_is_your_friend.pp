# fix an error in apache2

exec { 'replace':
  command => "sed -i 's/class-wp-locale.phpp/class-wp-locale.php/g' /var/www/html/wp-settings.php",
  path    => ['/bin', '/usr/bin'],
}
