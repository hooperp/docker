FROM phooper0001/centos-tomcat
RUN yum install java-1.8.0-openjdk-devel -y
RUN groupadd tomcat 
RUN useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
RUN yum install -y wget
RUN wget http://mirror.vorboss.net/apache/tomcat/tomcat-8/v8.0.30/bin/apache-tomcat-8.0.30.tar.gz
RUN mkdir /opt/tomcat      
RUN yum install -y tar 
RUN tar xvf apache-tomcat-8.0.30.tar.gz -C /opt/tomcat --strip-components=1
RUN rm apache-tomcat-8.0.30.tar.gz
RUN cd /opt/tomcat
RUN chown -R tomcat:tomcat /opt/tomcat
RUN chmod g+rwx /opt/tomcat/conf
RUN chmod g+r /opt/tomcat/conf/*
RUN chown -R tomcat /opt/tomcat/webapps/ /opt/tomcat/work/ /opt/tomcat/temp/ /opt/tomcat/logs/
RUN yum -y install openssh-server openssh-clients
RUN chkconfig sshd on

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD [“tomcat”]
