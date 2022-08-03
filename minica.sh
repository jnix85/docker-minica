#!/bin/bash

export JAVA_HOME=/opt/openjdk/17
export PATH=$PATH:$JAVA_HOME/bin 

if [ ! -f "/minica/conf/application.properties" ]
  then cp /minica/bin/application.properties /minica/conf/application.properties
fi 

java -jar /minica/bin/minica-1.0.jar --spring.config.location=/minica/conf/application.properties
