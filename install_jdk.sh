#!/bin/bash
PATH=/usr/bin:/usr/local/bin:/bin:/usr/sbin:/usr/local/sbin:/sbin
ARCH=$(uname -m)

JDK_AMD64="OpenJDK17U-jdk_x64_linux_hotspot_17.0.4_8.tar.gz"
JDK_AMD64_URL="https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.4%2B8/OpenJDK17U-jdk_x64_linux_hotspot_17.0.4_8.tar.gz"
JDK_AMD64_SHA="c0851d610b03cb51e9b360fef3e9ec2026c62837a143e7786649ba94f38cc0d1"

JDK_ARM64="OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.4_8.tar.gz"
JDK_ARM64_URL="https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.4%2B8/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.4_8.tar.gz"
JDK_ARM64_SHA="8c23b0b9c65cfe223a07edb8752026afd1e8ec1682630c2d92db4dd5aa039204"


if [ "$ARCH" == "x86_64" ]
  then wget $JDK_AMD64_URL && echo $JDK_AMD64_SHA  $JDK_AMD64 | sha256sum -c && tar xzf $JDK_AMD64 && mv jdk-17.0.4+8 /opt/openjdk/17 && rm -Rf $JDK_AMD64
elif [ "$ARCH" == "aarch64"]
  then wget $JDK_ARM64_URL && echo $JDK_ARM64_SHA  $JDK_ARM64 | sha256sum -c && tar xzf $JDK_ARM64 && mv jdk-17.0.4+8 /opt/openjdk/17 && rm -Rf $JDK_ARM64
fi