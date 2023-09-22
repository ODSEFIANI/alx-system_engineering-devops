#kill the process on terminal 0

exec { 'pkill':
  command  => 'pkill killmenow',
  provider => 'shell',
}
