class tomcat7::install (
  $tomcat_path = $tomcat7::params::tomcat_path,
  $tomcat_package = $tomcat7::params::tomcat_package,
  $tomcat_user = $tomcat7::params::tomcat_user,
  $tomcat_pass = $tomcat7::params::tomcat_pass ) inherits tomcat7::params {

file {
    "${tomcat_path}/${tomcat_package}":
      ensure => present,
      source => "puppet:///modules/tomcat7/${tomcat_package}",
      mode   => '0755',
      require => Class["java"]
  }
  user {
    'user_tomcat':
        ensure   => present,
        name     => $tomcat_user,
        password => $tomcat_pass,
        home    => '/home/tomcat',
 }

  exec {
    'Install_tomcat':
        path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        cwd     => $tomcat_path,
        command => "tar -xzf ${tomcat_path}/${tomcat_package}",
        require => [File["${tomcat_path}/${tomcat_package}"], User['user_tomcat']];

     'tomcat_owner':
        path    => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
        cwd     => $tomcat_path,
        command => "/bin/chown -R ${tomcat_user}. ${tomcat_path}",
        require => Exec['Install_tomcat']
        
    }

}





