### RobotFramework in Docker

#### 0、 Docker build RobotFramework image use [RobotFramework Dockerfile] in Slave vm.

```
$ docker build -t robot:latest .
```

#### 1、Update docker configuration for slave in slave vm . The docker configuration file location will depend your system, but it is likely to be /etc/init/docker.conf, /etc/sysconfig/docker , /etc/default/docker or /etc/default/docker.io.

```
DOCKER_OPTS="-H tcp://0.0.0.0:2376 -H unix:///var/run/docker.sock"
```
```
$ systemctl restart docker
```

#### 2、Use Docker cloud in jenkins master to configure robotframework node.

<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jenkins09.png" width="800" >
<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jenkins10.jpg" width="800" >
<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jenkins11.jpg" width="800" >

#### 3、Run a simple pipeline [version_pipeline_robot] in robotframework node. 

<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jenkins12.jpg" width="800" >





[RobotFramework Dockerfile]:https://github.com/zbbkeepgoing/containerization/blob/master/RobotFramework/Dockerfile
[version_pipeline_robot]:https://github.com/zbbkeepgoing/containerization/blob/master/RobotFramework/version_pipeline_robot
