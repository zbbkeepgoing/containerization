FROM centos:centos7

# ENV http_proxy http://192.168.88.130:8118
# ENV https_proxy http://192.168.88.130:8118

RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install PyYAML python-jinja2 python-httplib2 python-keyczar python-paramiko python-setuptools git python-pip java-1.8.0-openjdk* maven sshpass
RUN mkdir /etc/ansible/
RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts
RUN mkdir /opt/ansible/
RUN git clone -b stable-2.3 http://github.com/ansible/ansible.git /opt/ansible/ansible
WORKDIR /opt/ansible/ansible
RUN git submodule update --init
ENV PATH /opt/ansible/ansible/bin:/bin:/usr/bin:/sbin:/usr/sbin
ENV PYTHONPATH /opt/ansible/ansible/lib
ENV ANSIBLE_LIBRARY /opt/ansible/ansible/library
ENV ANSIBLE_HOST_KEY_CHECKING=False

ENV http_proxy ""
ENV https_proxy ""
