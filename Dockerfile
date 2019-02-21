# Extending image
FROM alpine:3.8

ENV NODE_VERSION 8.15.0

# Versions
RUN npm -v
RUN node -v

RUN npm cache clean

# Install app dependencies
COPY package.json /tmp/package.json
# COPY package-lock.json /usr/src/app/
RUN cd /tmp

RUN ls /tmp/

RUN npm install

RUN ls /tmp/
# Create app directory
RUN mkdir -p /usr/src/app & cp -a /tmp/node_modules /usr/src/app/

WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app



# Environment variables
# ENV NODE_ENV production
# ENV PORT 3000
# ENV PUBLIC_PATH "/"

# RUN npm run start:build

# Main command
CMD [ "npm", "run", "start" ]

# Port to listener
EXPOSE 3000