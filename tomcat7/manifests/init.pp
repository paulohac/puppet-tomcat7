class tomcat7 {
	include tomcat7::params 
	include tomcat7::install
	include tomcat7::config
	include tomcat7::service
}

