## Jenkins Master and Slave in Docker 

#### Jenkins Master

##### 0、 Docker build Jenkin Master image use [Jenkins Master Dockerfile] in Master vm.

```
$ cd jenkins-master
$ docker build -t jenkins:master .
```

##### 1、 Run jenkins_dockerconfig.sh in Master vm, This sh will init some configuration.

```
$ ./jenkins_dockerconfig.sh
```

##### 2、 Run jenkins_master_run.sh to run jenkins master.

```
$ ./jenkins_master_run.sh
```

### Jenkins Slave 

##### 0、Docker build Jenkin Slave image use [Jenkins Slave Dockerfile] in Slave vm.

```
$ cd jenkins-slave
$ docker build -t jenkins:slave .
```

##### 1、Use Docker cloud in jenkins master to configure jenkins slave.








[Jenkins Master Dockerfile]:https://github.com/zbbkeepgoing/containerization/tree/master/Jenkin/jenkins-master
[Jenkins Slave Dockerfile]:https://github.com/zbbkeepgoing/containerization/tree/master/Jenkin/jenkins-slave
