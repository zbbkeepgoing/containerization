# if network behind proxy, need add -e "JAVA_OPTS=-Dhttp.proxyHost=xxxx -Dhttp.proxyPort=xxxx -Dhttps.proxyHost=xxxx -Dhttps.proxyPort=xxxx"
docker run  -p 10000:8080 --name jenkins -v /opt/maven/settings.xml:/usr/share/maven/conf/settings.xml  -v /var/run/docker.sock:/var/run/docker.sock  -v /etc/localtime:/etc/localtime:ro -v /opt/jenkins_home:/var/jenkins_home -d  jenkins:master &
