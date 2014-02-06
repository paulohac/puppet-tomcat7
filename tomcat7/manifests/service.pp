class tomcat7::service
 (
  $service_name   = tomcat,
  $service_enable = true,
  $service_ensure = 'running',
){

  service { 'tomcat':
    ensure => $service_ensure,
    name   => $service_name,
    enable => $service_enable,
  }
}

