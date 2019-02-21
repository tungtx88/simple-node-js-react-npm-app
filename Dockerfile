# # Extending image
# FROM node:6-alpine

# # Create app directory
# RUN mkdir -p /usr/src/app
# WORKDIR /usr/src/app

# # Versions
# RUN npm -v
# RUN node -v

# # Install app dependencies
# COPY package.json /usr/src/app/
# COPY package-lock.json /usr/src/app/

# RUN npm install

# # Bundle app source
# COPY . /usr/src/app

# # Environment variables
# ENV NODE_ENV test

# # Main command
# CMD [ "npm", "run", "test" ]

FROM node:8-alpine

WORKDIR /tmp
COPY package.json package-lock.json* ./
RUN npm install --no-optional && npm cache clean --force

RUN mkdir -p /usr/src/app && cp -a /tmp/node_modules /usr/src/app/

WORKDIR /usr/src/app
COPY . /usr/src/app/

CMD [ "npm", "run", "start" ]

EXPOSE 3000