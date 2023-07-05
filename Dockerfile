FROM anapsix/alpine-java:8u202b08_jdk
MAINTAINER RamboLiu <ramboliu@ramboliu.com>
RUN mkdir -p /opt/sentinel/
ENV SENTINEL_VERSION 1.8.6
RUN wget https://github.com/alibaba/Sentinel/releases/download/${SENTINEL_VERSION}/sentinel-dashboard-${SENTINEL_VERSION}.jar -O /opt/sentinel/app.jar
EXPOSE 8858
EXPOSE 8719
ENV USERNAME sentinel
ENV PASSWORD sentinel
WORKDIR /opt/sentinel
ENTRYPOINT ["bash", "-c", "java -Djava.security.egd=file:/dev/./urandom -Dserver.port=8858 -Dcsp.sentinel.api.port=8719 -Dsentinel.dashboard.auth.username=${USERNAME} -Dsentinel.dashboard.auth.password=${PASSWORD} -Dcsp.sentinel.dashboard.server=localhost:8858 -Dproject.name=sentinel-dashboard -jar app.jar"]