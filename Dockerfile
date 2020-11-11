#FROM node:15.1.0
#FROM registry.access.redhat.com/rhscl/nodejs-4-rhel7
FROM node:lts

# Create app directory
WORKDIR /deployments

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
#RUN npm config get proxy
#RUN npm config get https-proxy
#RUN cat /etc/hosts
#RUN ping registry.npmjs.org
#RUN ping registry.cnpmjs.org
#RUN npm config set registry https://registry.npm.taobao.org

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3000
CMD [ "node", "index.js" ]