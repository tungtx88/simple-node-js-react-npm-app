# Extending image
FROM node:6-alpine

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Versions
RUN npm -v
RUN node -v

# Install app dependencies
COPY package.json /usr/src/app/
COPY package-lock.json /usr/src/app/

RUN npm install

# Bundle app source
COPY . /usr/src/app

# Environment variables
ENV NODE_ENV test

# Main command
CMD [ "npm", "run", "test" ]