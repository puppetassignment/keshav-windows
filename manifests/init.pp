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

#dism { 'IIS-WebServer':
#  ensure => present,
#}

file { 'C:/extractdir':
  ensure => directory,
  }

#staging::deploy { '7za920.zip':
#  source => 'puppet:///modules/windowsk/7za920.zip',
#  target => 'C:/extractdir',
#}

exec { 'install-chocolatey':
command => "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))",
provider => powershell,
}

package { '7zip':
  ensure   => installed,
  provider => 'chocolatey',
}


}
