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

RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -; \
   echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
   apt-get update -qqy \
   apt-get -qqy install google-chrome-unstable \
   rm /etc/apt/sources.list.d/google-chrome.list \
   rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN CHROME_DRIVER_REMOTEPATH=$(wget -q -O - https://chromedriver.storage.googleapis.com | grep -oP '(?<=Key>)[^<]*' | grep chromedriver_linux64.zip | sort -Vr | head -1 ) \
   wget --no-verbose -O /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_REMOTEPATH \
   unzip /tmp/chromedriver_linux64.zip \
   rm /tmp/chromedriver_linux64.zip \
   chmod 755 /tmp/chromedriver \
   ln -fs /tmp/chromedriver /usr/bin/chromedriver

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install robotframework
RUN pip install robotframework-seleniumlibrary
RUN pip install robotframework-faker
RUN pip install robotframework-selenium2library


ENV http_proxy ""
ENV https_proxy ""

