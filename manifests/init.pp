class windowsk {

user { 'keshav':
  ensure => present,
}

user { 'puser':
  ensure => present,
  comment => 'User managed by puppet',
  groups => 'puppetadmin',
  managehome => yes,
  password => 'xoriant123#',
}

group { 'puppetadmin':
  ensure => present,
  members => 'keshav',
}

file { 'windir':
  ensure => directory,
  path => 'C:/skill_builder',
  owner => 'puser',
  group => 'puppetadmin',
}

acl { 'C:/skill_builder':
  permissions                => [
   { identity => 'puser', rights => ['full'] },
   { identity => 'puppetadmin', rights => ['read'] },
  ],
  inherit_parent_permissions => false,
}

}
