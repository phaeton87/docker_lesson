FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y git maven default-jdk

RUN git clone https://github.com/phaeton87/boxfuse-sample-java-war-hello

WORKDIR /boxfuse-sample-java-war-hello
RUN mvn package

FROM tomcat:9.0
COPY --from=0 /boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]