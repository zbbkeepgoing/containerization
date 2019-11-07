# if network behind proxy, need add -e "JAVA_OPTS=-Dhttp.proxyHost=xxxx -Dhttp.proxyPort=xxxx -Dhttps.proxyHost=xxxx -Dhttps.proxyPort=xxxx"
bash jenkins_dockerconfig.sh
docker run  -p 10000:8080 --name jenkins -v /opt/maven/settings.xml:/usr/share/maven/conf/settings.xml  -v /var/run/docker.sock:/var/run/docker.sock  -v /etc/localtime:/etc/localtime:ro -v /opt/jenkins_home:/var/jenkins_home -d  jenkins:master &

# sleep
sleep 10s
docker run -d --name plugin binbin0126/jenkinsplugin:latest
sleep 5s
docker cp plugin:/home/plugin.tar.gz /opt/jenkins_home	
tar -zxvf /opt/jenkins_home/plugin.tar.gz -C /opt/jenkins_home/plugins
sleep 5s
bash jenkins_dockerconfig.sh
docker stop plugin
docker rm plugin
