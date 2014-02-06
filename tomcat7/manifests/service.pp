class tomcat7::service
 (
  $service_name   = $tomcat7::params::service_name,
  $service_enable = $tomcat7::params::service_enable,
  $service_ensure = $tomcat7::params::service_ensure,
  $service_status = $tomcat7::params::service_status,
)inherits tomcat7::params {

#hasstatus false to evaluate the service start command
  service { '$service_name':
    ensure => $service_ensure,
    name   => $service_name,
    enable => $service_enable,
    hasstatus => false,
    status => $service_status,
    hasrestart => true
  }
}

