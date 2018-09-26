# The MIT License
#
#  Copyright (c) 2015-2017, CloudBees, Inc. and other Jenkins contributors
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.

FROM openjdk:8-jdk

# if network behind proxy,need add this proxy env
ENV http_proxy http://192.168.88.128:8118
ENV https_proxy http://192.168.88.128:8118

# install some dependencies,maybe someone we don't need,if you find,you can remove it,will resize this master images
RUN apt-get update && apt-get install -y --no-install-recommends \
 g++ \
 gcc \
 libc6-dev \
 pkg-config \
 git \
 curl  \
 make \
 build-essential \
 libssl-dev \
 zlib1g-dev \
 libbz2-dev \
 libreadline-dev \
 libsqlite3-dev \
 llvm \
 libncurses5-dev \
 libncursesw5-dev \
 xz-utils \
 tk-dev \
 maven \
 ant \
 ruby \
 python \
 php \
 apt-transport-https \
 libunwind8  \
 gettext \
 sshpass \
 && rm -rf /var/lib/apt/lists/*



# Install NodeJs 10.x , if you don't need, you can remove it,you also can change version
RUN curl -sL https://deb.nodesource.com/setup_10.x |  bash -
RUN apt-get  update && apt-get install -y \
    nodejs

# Install Python3.7 , if you don't need, you can remove it ,you also can change version
RUN wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
RUN tar xvf Python-3.7.0.tgz
RUN rm -rf  Python-3.7.0.tgz
RUN cd Python-3.7.0 \
    ./configure --enable-optimizations \
    make -j8 \
    make altinstall

# Install Golang1.10.3 , if you don't need, you can remove it,you also can change version
ENV GOLANG_VERSION 1.10.3

RUN set -eux; \
        \
# this "case" statement is generated via "update.sh"
        dpkgArch="$(dpkg --print-architecture)"; \
        case "${dpkgArch##*-}" in \
                amd64) goRelArch='linux-amd64'; goRelSha256='fa1b0e45d3b647c252f51f5e1204aba049cde4af177ef9f2181f43004f901035' ;; \
                armhf) goRelArch='linux-armv6l'; goRelSha256='d3df3fa3d153e81041af24f31a82f86a21cb7b92c1b5552fb621bad0320f06b6' ;; \
                arm64) goRelArch='linux-arm64'; goRelSha256='355128a05b456c9e68792143801ad18e0431510a53857f640f7b30ba92624ed2' ;; \
                i386) goRelArch='linux-386'; goRelSha256='3d5fe1932c904a01acb13dae07a5835bffafef38bef9e5a05450c52948ebdeb4' ;; \
                ppc64el) goRelArch='linux-ppc64le'; goRelSha256='f3640b2f0990a9617c937775f669ee18f10a82e424e5f87a8ce794a6407b8347' ;; \
                s390x) goRelArch='linux-s390x'; goRelSha256='34385f64651f82fbc11dc43bdc410c2abda237bdef87f3a430d35a508ec3ce0d' ;; \
                *) goRelArch='src'; goRelSha256='567b1cc66c9704d1c019c50bef946272e911ec6baf244310f87f4e678be155f2'; \
                        echo >&2; echo >&2 "warning: current architecture ($dpkgArch) does not have a corresponding Go binary release; will be building from source"; echo >&2 ;; \
        esac; \
        \
        url="https://golang.org/dl/go${GOLANG_VERSION}.${goRelArch}.tar.gz"; \
        wget -O go.tgz "$url"; \
        echo "${goRelSha256} *go.tgz" | sha256sum -c -; \
        tar -C /usr/local -xzf go.tgz; \
        rm go.tgz; \
        \
        if [ "$goRelArch" = 'src' ]; then \
                echo >&2; \
                echo >&2 'error: UNIMPLEMENTED'; \
                echo >&2 'TODO install golang-any from jessie-backports for GOROOT_BOOTSTRAP (and uninstall after build)'; \
                echo >&2; \
                exit 1; \
        fi; \
        \
        export PATH="/usr/local/go/bin:$PATH"; \
        go version

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
WORKDIR $GOPATH


# Install Dotnet-SDK 2.1.302, if you don't need, you can remove it,you also can change version
RUN wget https://download.microsoft.com/download/4/0/9/40920432-3302-47a8-b13c-bbc4848ad114/dotnet-sdk-2.1.302-linux-x64.tar.gz
RUN mkdir -p /home/dotnet && tar zxf dotnet-sdk-2.1.302-linux-x64.tar.gz -C /home/dotnet
ENV DOTNET_ROOT $PATH:/home/dotnet
ENV PATH $PATH:/home/dotnet
RUN rm -rf dotnet-sdk-2.1.302-linux-x64.tar.gz




# Install dockerce for build docker images  in docker for jenkins, if you don't need, you can remove it,you also can change version
RUN apt-get update && \
    apt-get -y install apt-transport-https \
     ca-certificates \
     gnupg2 \
     software-properties-common && \
    curl -fsSL https://apt.dockerproject.org/gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/yarn.gpg &&\
    apt-add-repository \
   "deb https://apt.dockerproject.org/repo debian-$(lsb_release -cs) main"
RUN apt-get update && \
    apt-get -y install docker-engine


RUN apt-get clean && apt-get autoclean


# Install Jenkins
ARG user=jenkins
ARG group=jenkins
ARG uid=1000
ARG gid=1000

ARG bbdocker=12345
USER root

ENV HOME /home/${user}
RUN groupadd -g ${gid} ${group}
RUN useradd -c "Jenkins user" -d $HOME -u ${uid} -g ${gid} -m ${user}
LABEL Description="This is a base image, which provides the Jenkins agent executable (slave.jar)" Vendor="Jenkins project" Version="3.20"

RUN groupadd -g ${bbdocker} bbdocker  && gpasswd -a ${user} bbdocker


ARG VERSION=3.20
ARG AGENT_WORKDIR=/home/${user}/agent

RUN curl --create-dirs -sSLo /usr/share/jenkins/slave.jar https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/${VERSION}/remoting-${VERSION}.jar \
  && chmod 755 /usr/share/jenkins \
  && chmod 644 /usr/share/jenkins/slave.jar

USER ${user}
ENV AGENT_WORKDIR=${AGENT_WORKDIR}
RUN mkdir /home/${user}/.jenkins && mkdir -p ${AGENT_WORKDIR}

VOLUME /home/${user}/.jenkins
VOLUME ${AGENT_WORKDIR}
WORKDIR /home/${user}

