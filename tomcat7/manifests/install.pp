class tomcat7::install (
  $tomcat_path        = $tomcat7::params::tomcat_path,
  $tomcat_package     = $tomcat7::params::tomcat_package,
  $tomcat_user        = $tomcat7::params::tomcat_user,
  $tomcat_pass        = $tomcat7::params::tomcat_pass,
  $tomcat_ensure      = $tomcat7::params::tomcat_ensure,
  $tomcat_user_ensure = $tomcat7::params::tomcat_user_ensure) inherits tomcat7::params {

  file {
    "${tomcat_path}/${tomcat_package}":
      ensure  => $tomcat_ensure,
      source  => "puppet:///modules/tomcat7/${tomcat_package}",
      mode    => '0755',
      require => Class["java"]
  }->
  
  exec {
    'Install_tomcat':
      path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
      cwd     => $tomcat_path,
      command => $tomcat_extract"tar -xzf ${tomcat_path}/${tomcat_package}",
  }->
  
  exec {
    'tomcat_owner':
      path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
      cwd     => $tomcat_path,
      command => "/bin/chown -R ${tomcat_user}. ${tomcat_path}",
  }
  
  user {
    'user_tomcat':
      ensure   => $tomcat_user_ensure,
      name     => $tomcat_user,
      password => $tomcat_pass,
      home     => '/home/tomcat',
 }

}





