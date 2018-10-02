# containerization

This repo is for containerization of some of open source soft,such as jenkins、
storm、spark、mysql、redis、mongo、kafka and so on. and scripts, dockerfile and
kubernetes yaml will be update  one by one.

If you want to use container to run the above software, This repo is very suitable 
for you. Next, we will introduce the steps of containerization one by one.


## Jenkins in Docker ###

All file you can find in [Jenkins] , you can find jenkins master in docker and 
jenkins slave in docker. you can build jenkins master and slave images. You
can run jenkins master by sh. and use docker cloud to configure jenkins slave as a agent/node
in jenkins master.

#### Master Folder [Jenkins Master]

#### Slave Folder [Jenkins Slave]

## RobotFramework in Docker ###

All file you can find in [RobotFramework] , you can find RobotFramework Dockerfile , this Dockerfile include robotframework、robotframework-seleniumlibrary、robotframework-faker、robotframework-selenium2library. you can build a robotFramework Image to run WEB-UI Automated Testing . if you want use other Automated Testing , this Dockerfile is the base images , you can use docker cloud to configure RobotFramework as a agent/node in jenkins master.

## Jmeter in Docker ###

All file you can find in [Jmeter] , you can find Jmeter Dockerfile , you can use docker cloud to configure Jmeter as a agent/node in jenkins master.

## Ansible in Docker ###

All file you can find in [Ansible] , you can find Ansible Dockerfile , you can use docker cloud to configure Ansible as a agent/node in jenkins master.

## SonarQube in Docker ###

All file you can find in [SonarQube] , you can find SonarQube Dockerfile .






[Jenkins]: https://github.com/zbbkeepgoing/containerization/tree/master/Jenkin
[Jenkins Master]:https://github.com/zbbkeepgoing/containerization/tree/master/Jenkin/jenkins-master
[Jenkins Slave]: https://github.com/zbbkeepgoing/containerization/tree/master/Jenkin/jenkins-slave
[RobotFramework]: https://github.com/zbbkeepgoing/containerization/tree/master/RobotFramework
[Jmeter]: https://github.com/zbbkeepgoing/containerization/tree/master/Jmeter
[Ansible]: https://github.com/zbbkeepgoing/containerization/tree/master/Ansible
[SonarQube]: https://github.com/zbbkeepgoing/containerization/tree/master/Sonarqube
