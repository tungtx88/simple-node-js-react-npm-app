FROM node:6-alpine
MAINTAINER David Weinstein <david@bitjudo.com>

# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:
COPY package.json /tmp/package.json
RUN cd /tmp && npm install
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /var/jenkins_home/workspace/abca_master/

# From here we load our application's code in, therefore the previous docker
# "layer" thats been cached will be used if possible
WORKDIR /var/jenkins_home/workspace/abca_master
COPY . /var/jenkins_home/workspace/abca_master
EXPOSE 3000

