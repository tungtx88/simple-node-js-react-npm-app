FROM node:6-alpine

#ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
#ENV PATH=$PATH:/home/node/.npm-global/bin

RUN mkdir -p /home/node/app/node_modules
RUN chown -R node:node /home/node/app

#USER node

#WORKDIR /home/node/app

#RUN npm install --silent --progress=false ; \
#    npm i -g babel-cli --silent --progress=false ;\
#    npm i -g flow-bin --silent --progress=false