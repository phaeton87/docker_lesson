FROM tomcat:latest

RUN apt update
RUN apt install -y git maven default-jdk
RUN git clone https://github.com/phaeton87/boxfuse-sample-java-war-hello

WORKDIR /boxfuse-sample-java-war-hello

RUN mvn package
RUN cp /target/hello-1.0.war /var/lib/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]