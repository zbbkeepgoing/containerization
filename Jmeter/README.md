### Jmeter in Docker

#### 0、 Docker build Jmeter image use [Jmeter Dockerfile] in Slave vm.

```
$ docker build -t jmeter:latest .
```

#### 1、Update docker configuration for slave in slave vm . The docker configuration file location will depend your system, but it is likely to be /etc/init/docker.conf, /etc/sysconfig/docker , /etc/default/docker or /etc/default/docker.io.

```
DOCKER_OPTS="-H tcp://0.0.0.0:2376 -H unix:///var/run/docker.sock"
```
```
$ systemctl restart docker
```

#### 2、Use Docker cloud in jenkins master to configure jmeter node.

<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jmeter13.png" width="800" >
<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jmeter14.jpg" width="800" >

#### 3、Run a simple pipeline [version_pipeline_jmeter] in jmeter node. 

<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/jmeter15.jpg" width="800" >





[Jmeter Dockerfile]:https://github.com/zbbkeepgoing/containerization/blob/master/Jmeter/Dockerfile
[version_pipeline_jmeter]:https://github.com/zbbkeepgoing/containerization/blob/master/Jmeter/version_pipeline_jmeter
