$content = 'I love Puppet'

file {'/tmp/school':
  ensure  => file,
  content => $content,
  owner   => 'www-data',
  group   => 'www-data',
  mode    => '0744',
}
