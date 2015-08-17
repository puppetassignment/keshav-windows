class windowsk {

user { 'keshav':
  ensure => present,

}

group { 'puppetadmin':
  ensure => present,
  members => 'keshav',
}

}
