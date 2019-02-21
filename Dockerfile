# Extending image
FROM node:6-alpine

# Versions
RUN yarn -v
RUN node -v

# Install app dependencies
ADD package.json /tmp/package.json
# COPY package-lock.json /usr/src/app/
RUN cd /tmp
RUN yarn install

# Create app directory
RUN mkdir -p /usr/src/app
RUN cp -a /tmp/node_modules /usr/src/app/

WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app



# Environment variables
# ENV NODE_ENV production
# ENV PORT 3000
# ENV PUBLIC_PATH "/"

# RUN npm run start:build

# Main command
CMD [ "yarn", "start" ]

# Port to listener
EXPOSE 3000