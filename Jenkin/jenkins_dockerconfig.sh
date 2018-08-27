setenforce 0
# mkdir jenkins home
mkdir -p /opt/jenkins_home
# mkdir maven home , for update setting.xml
mkdir -p /opt/maven
# add a bbdocker group for jenkins docker
groupadd -g 12345 bbdocker
# update folder owner
chgrp -v bbdocker -R /var/run/docker.sock
chgrp -v bbdocker -R /opt/jenkins_home
chgrp -v bbdocker -R /opt/maven
chmod  -R 775 /opt/jenkins_home
chmod  -R 775 /opt/maven
cp -rf settings.xml /opt/maven
