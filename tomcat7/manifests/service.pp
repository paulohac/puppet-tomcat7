class tomcat7::service
 (
  $service_name   = $tomcat7::params::service_name,
  $service_enable = $tomcat7::params::service_enable,
  $service_ensure = $tomcat7::params::service_ensure,
)inherits tomcat7::params {

#hasstatus false to evaluate the service start command
  service { '$service_name':
    ensure => $service_ensure,
    name   => $service_name,
    enable => $service_enable,
    hasstatus => false,
    hasrestart => true
  }
}

