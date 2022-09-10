FROM rockylinux:9
RUN dnf install java -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.23/bin/apache-tomcat-10.0.23.tar.gz . 
RUN tar -xvzf apache-tomcat-10.0.23.tar.gz
RUN mv apache-tomcat-10.0.23/* /opt/tomcat
#EXPOSE 8080
COPY ./target/hello-world-0.0.1-SNAPSHOT.war /opt/tomcat/webapps
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
