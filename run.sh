docker run -p 127.0.0.1:80:8080 -p 127.0.0.1:22222:22 --env JAVA_HOME=/usr --env PATH=$JAVA_HOME/bin:$PATH -h centos-tomcat -t -i phooper/centos-tomcat /opt/tomcat/bin/catalina.sh run
