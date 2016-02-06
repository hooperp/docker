FROM centos:6
MAINTAINER 'Paul Hooper from DEVOPSSHOP'
RUN yum install java-1.7.0-openjdk-devel -y
RUN groupadd tomcat 
RUN useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
RUN yum install -y wget
RUN wget http://mirror.vorboss.net/apache/tomcat/tomcat-8/v8.0.30/bin/apache-tomcat-8.0.30.tar.gz
RUN mkdir /opt/tomcat      
RUN yum install -y tar 
RUN tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1
RUN cd /opt/tomcat
RUN chown -R tomcat:tomcat /opt/tomcat
RUN chmod g+rwx /opt/tomcat/conf
RUN chmod g+r /opt/tomcat/conf/*
RUN chown -R tomcat /opt/tomcat/webapps/ /opt/tomcat/work/ /opt/tomcat/temp/ /opt/tomcat/logs/

ENTRYPOINT /op[t/tomcat

RUN /opt/tomcat/bin/startup.sh

RUN export PS1=$(hostname)-PaulHooper

RUN echo "All done"

