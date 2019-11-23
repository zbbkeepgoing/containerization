# FROM ubuntu:16.04
FROM openjdk:8-jdk
# ENV http_proxy http://192.168.88.130:8118
# ENV https_proxy http://192.168.88.130:8118

RUN apt-get update && apt-get install -y --no-install-recommends \
 python \
 python-pip \
 unzip \
 libx11-6 \
 libnss3 \
 libfontconfig1 \
# libgconf2-4 \
 wget \
 git \
# openjdk-8-jdk \
 && rm -rf /var/lib/apt/lists/*



RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install robotframework
RUN pip install robotframework-seleniumlibrary
RUN pip install robotframework-faker
RUN wget  https://chromedriver.storage.googleapis.com/2.42/chromedriver_linux64.zip; \
    unzip chromedriver_linux64.zip; \
    rm -rf chromedriver_linux64.zip; \
    mv -f chromedriver /usr/local/bin/chromedriver;
RUN pip install robotframework-selenium2library
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -;\
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && apt-get install google-chrome-stable -y --force-yes

ENV http_proxy ""
ENV https_proxy ""

