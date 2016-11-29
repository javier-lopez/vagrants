#!/bin/sh
set -e
printf "%s\\n" "$0"

jdk_tar_gz="jdk-7u79-linux-x64.tar.gz"
jdk="jdk1.7.0_79"

if [ ! -f /usr/src/"${jdk_tar_gz}" ]; then
    yum -y install wget || :
    wget --progress=bar:force --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/7u79-b15/${jdk_tar_gz}" -O /usr/src/"${jdk_tar_gz}" || cp /vagrant/deploy/local_archive/"${jdk_tar_gz}" /usr/src/
fi

if [ ! -f /opt/"${jdk}"/bin/java ]; then
    cp /usr/src/"${jdk_tar_gz}" /opt/"${jdk_tar_gz}"
    ( cd /opt && tar xzf "${jdk_tar_gz}" )
    rm -rf /opt/"${jdk_tar_gz}"
fi

alternatives --install   /usr/bin/java java /opt/"${jdk}"/bin/java 2
alternatives --install   /usr/bin/jar jar /opt/"${jdk}"/bin/jar 2
alternatives --install   /usr/bin/javac javac /opt/"${jdk}"/bin/javac 2

alternatives --set java  /opt/"${jdk}"/bin/java
alternatives --set jar   /opt/"${jdk}"/bin/jar
alternatives --set javac /opt/"${jdk}"/bin/javac

for dir in /root /home/*; do
    [ ! -d "${dir}" ] && continue
    if ! grep "^JAVA_HOME=/opt/${jdk}" "${dir}"/.bashrc; then
        printf "%s\\n" "JAVA_HOME=/opt/${jdk}" >> "${dir}"/.bashrc
    fi

    if ! grep "^JRE_HOME=/opt/${jdk}/jre" "${dir}"/.bashrc; then
        printf "%s\\n" "JRE_HOME=/opt/${jdk}/jre" >> "${dir}"/.bashrc
    fi

    if ! grep "PATH" "${dir}"/.bashrc | grep "/opt/${jdk}/bin"; then
        printf "%s\\n" PATH=$PATH:/opt/${jdk}/bin:/opt/${jdk}/jre/bin >> "${dir}"/.bashrc
    fi
done

java -version
