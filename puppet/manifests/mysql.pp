class mysql::install {
  package { "mysql-server":
    ensure => present,
  }

  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }

  exec { "set-mysql-password":
    unless  => "mysql -uroot -proot",
    path    => ["/bin", "/usr/bin"],
    command => "mysqladmin -uroot password root",
    require => Service["mysql"],
  }

  exec { "create-database":
    unless  => "/usr/bin/mysql -usite_development -psite_development site_development",
    command => "/usr/bin/mysql -uroot -proot -e \"create database site_development; grant all on site_development.* to site_dev@localhost identified by 'site_development';\"",
    require => Service["mysql"],
  }
}

node default {
  include mysql::install
}