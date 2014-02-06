class tomcat7::config (
  $tomcat_home = $tomcat7::params::tomcat_home,
  $java_home = $tomcat7::params::java_home ) inherits tomcat7::params {

	file { "/etc/init.d/tomcat":
		ensure => present,
		content => template("tomcat7/tomcat.erb"),
		owner   => 'root',
    		group   => 'root',
    		mode    => '0755',
		require => Class["tomcat7::install"]
  	} 


}


