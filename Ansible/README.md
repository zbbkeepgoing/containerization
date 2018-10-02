### Ansible in Docker

#### 0、 Docker build Ansible image use [Ansible Dockerfile] in Slave vm.

```
$ docker build -t ansible:latest .
```

#### 1、Update docker configuration for slave in slave vm . The docker configuration file location will depend your system, but it is likely to be /etc/init/docker.conf, /etc/sysconfig/docker , /etc/default/docker or /etc/default/docker.io.

```
DOCKER_OPTS="-H tcp://0.0.0.0:2376 -H unix:///var/run/docker.sock"
```
```
$ systemctl restart docker
```

#### 2、Use Docker cloud in jenkins master to configure ansible node.

<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/ansible16.jpg" width="800" >
<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/ansible17.jpg" width="800" >
<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/ansible18.jpg" width="800" >

#### 3、Run a simple pipeline [version_pipeline_ansible] in ansible node. 

<img src="https://github.com/zbbkeepgoing/containerization/blob/master/Imgs/ansible19.jpg" width="800" >





[Ansible Dockerfile]:https://github.com/zbbkeepgoing/containerization/blob/master/Ansible/Dockerfile
[version_pipeline_ansible]:https://github.com/zbbkeepgoing/containerization/blob/master/Ansible/version_pipeline_ansible
