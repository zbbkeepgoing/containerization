# if network behind proxy, need add -e "JAVA_OPTS=-Dhttp.proxyHost=xxxx -Dhttp.proxyPort=xxxx -Dhttps.proxyHost=xxxx -Dhttps.proxyPort=xxxx"
echo "-------------------------------------------"
echo "--------Jenkins Master Run Begining--------"
echo "-------------------------------------------"

echo "init some information for run jenkins master"
bash jenkins_dockerconfig.sh

echo "-------------------------------------------"
echo "--------Jenkins Master Running-------------"
echo "-------------------------------------------"
echo "docker run jenkins master"
docker run  -p 10000:8080 --name jenkins -v /opt/maven/settings.xml:/usr/share/maven/conf/settings.xml  -v /var/run/docker.sock:/var/run/docker.sock  -v /etc/localtime:/etc/localtime:ro -v /opt/jenkins_home:/var/jenkins_home -d  jenkinsmaster:latest &


echo "-------------------------------------------"
echo "--------Jenkins Plugins Runing-------------"
echo "----------Just For Copy jpi----------------"
echo "-------------------------------------------"
echo "sleeping 4s"
# sleep
sleep 4s
echo "docker run jenkins plugin"
docker run -d --name plugin jenkinsplugin:latest
echo "sleeping 2s"
sleep 2s
echo "cp jpi files from docker to hostpath"
docker cp plugin:/home/plugin.tar.gz /opt/jenkins_home	
echo "taring begin..........."
tar -zxvf /opt/jenkins_home/plugin.tar.gz -C /opt/jenkins_home/plugins

count=`ls /opt/jenkins_home/plugins/*.jpi | wc -w`
echo "plugin number:$count"
while [ $count -lt 10 ]
do
   echo "needing taring again,taring plugin number:$count"
   tar -zxvf /opt/jenkins_home/plugin.tar.gz -C /opt/jenkins_home/plugins
   count=`ls /opt/jenkins_home/plugins/*.jpi | wc -w`
done
echo "taring end..........."

echo "sleeping 1s"
sleep 1s
echo "-------------------------------------------"
echo "--------Jenkins Master Restarting----------"
echo "-------------------------------------------"
echo "docker restart jenkins master"
docker restart jenkins
echo "sleep 2s"
sleep 2s
echo "init some information for plugin init"
bash jenkins_dockerconfig.sh
echo "-------------------------------------------"
echo "---------Jenkins Plugins Remove------------"
echo "-------------------------------------------"
echo "docker stop plugin"
docker stop plugin
echo "docker rm plugin"
docker rm plugin
echo "jenkins master is Running"
echo "Done"
