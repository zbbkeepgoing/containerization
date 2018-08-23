## Jenkins Master and Slave in Docker

#### Jenkins Master

##### 0、 Docker build Jenkin Master image use [Jenkins Master Dockerfile] in Master vm.

##### 1、 Run jenkins_dockerconfig.sh in Master vm, This sh will init some configuration.

##### 2、 Run jenkins_master_run.sh to run jenkins master.


### Jenkins Slave 

##### 0、Docker build Jenkin Slave image use [Jenkins Slave Dockerfile] in Slave vm.

##### 1、Use Docker cloud in jenkins master to configure jenkins slave.






[Jenkins Master Dockerfile]:https://github.com/zbbkeepgoing/containerization/tree/master/Jenkin/jenkins-master
[Jenkins Slave Dockerfile]:https://github.com/zbbkeepgoing/containerization/tree/master/Jenkin/jenkins-slave
