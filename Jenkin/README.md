## Jenkins Master and Slave in Docker 

### Jenkins Master

#### 0、 Docker build Jenkin Master image use [Jenkins Master Dockerfile] in Master vm.

```
$ cd jenkins-master
$ docker build -t jenkins:master .
```

#### 1、 Run jenkins_dockerconfig.sh in Master vm, This sh will init some configuration.

```
$ ./jenkins_dockerconfig.sh
```

#### 2、 Run jenkins_master_run.sh to run jenkins master.

```
$ ./jenkins_master_run.sh
```

#### 3、Configure jenkins master.

##### visit ip:10000.

<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jenkins01.jpg" width="600" >

##### docker logs -f dockerid, and copy the password, or get it from /opt/jenkins_home/secrets/initialAdminPassword in master vm.

<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jenkins02.jpg" width="600" >

##### install default plugin by auto

<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jenkins03.jpg" width="600" >

##### configure a default admin acount.

<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jenkins04.jpg" width="600" >

#### 4、Run a simple pipeline [version_pipeline] in master jenkins. 

<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jenkins05.jpg" width="600" >

#### 5、Jenkins mater in docker is done.


### Jenkins Slave 

#### 0、Docker build Jenkin Slave image use [Jenkins Slave Dockerfile] in Slave vm.

```
$ cd jenkins-slave
$ docker build -t jenkins:slave .
```

#### 1、Use Docker cloud in jenkins master to configure jenkins slave.









[Jenkins Master Dockerfile]:https://github.com/zbbkeepgoing/containerization/tree/master/Jenkin/jenkins-master
[Jenkins Slave Dockerfile]:https://github.com/zbbkeepgoing/containerization/tree/master/Jenkin/jenkins-slave
[version_pipeline]:https://github.com/zbbkeepgoing/containerization/blob/master/Jenkin/version_pipeline
