class tomcat7::params {

        $memory_heap = "-server -Xms256m -Xmx1024m -Dbuild.compiler.emacs=true"
        $tomcat_user = "tomcat"
        $tomcat_home = "/tomcat/apache-tomcat-7.0.50"
        $tomcat_package = "apache-tomcat-7.0.50.tar.gz"
        $tomcat_path = "/tomcat"
        $tomcat_pass = "123mudar"
        $java_home = "/opt/java"
        
        #service variables
        $service_name = "tomcat"
        $service_enable = "true"
        $service_ensure = "running"
        $service_status = "service tomcat status"
}

