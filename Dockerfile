FROM rockylinux:8

ADD install_jdk.sh /install_jdk.sh
RUN dnf makecache && \
    dnf install -y wget unzip && \
    mkdir -p /opt/openjdk/17 && \
    chmod +x /install_jdk.sh && \
    sh /install_jdk.sh && \
    mkdir -p /minica/bin /minica/conf /minica/data

ADD minica-1.0.0.jar /minica/bin/minica-1.0.0.jar
ADD minica.sh /minica/bin/minica.sh
ADD application.properties /minica/bin/application.properties

RUN chmod +x /minica/bin/minica.sh && chown -R 998:998 /minica

ENV JAVA_HOME /opt/openjdk/17 
ENV PATH $PATH:$JAVA_HOME/bin 

VOLUME /minica/conf /minica/data 
EXPOSE 8080

USER 998
CMD [ "/minica/bin/minica.sh" ]