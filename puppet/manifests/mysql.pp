class mysql::install {
  package {
    'mysql-server': ensure => present;
  }
  
  service {
    'mysql': ensure => running;
  }
}

node default {
  include mysql::install
}