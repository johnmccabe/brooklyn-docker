FROM gliderlabs/alpine:3.1

RUN apk-install openjdk7-jre-base ; \
    apk-install bash ; \
    apk-install wget

ENV brooklyndist brooklyn-dist-0.9.0-20151130.1634
ENV brooklyn.webconsole.security.users docker
ENV brooklyn.webconsole.security.user.docker.password docker

RUN wget http://ccweb.cloudsoftcorp.com/maven/libs-release-local/org/apache/brooklyn/brooklyn-dist/0.9.0-20151130.1634/${brooklyndist}-dist.tar.gz -O /${brooklyndist}.tar.gz ; \
    tar zxf ${brooklyndist}.tar.gz ; \
    rm -f ${brooklyndist}.tar.gz

WORKDIR /${brooklyndist}

VOLUME [ "/root/.brooklyn", "/root/.ssh" , "/root/.brooklyn-persistance" ]

EXPOSE 8081

ENTRYPOINT ./bin/brooklyn launch --persist auto --persistenceDir /root/.brooklyn-persistance