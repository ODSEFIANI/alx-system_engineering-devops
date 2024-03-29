# Install Nginx with pupp config

file_line { 'homepage':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}
package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
file { '/var/www/html/index.nginx-debian.html':
  content => 'Hello World!',
}
