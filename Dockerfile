# Setup development environment for Proof of Existence
FROM node:carbon
LABEL maintainer="Clement Renaud <clement@poex.io>"

ENV NPM_CONFIG_LOGLEVEL info

RUN apt-get update && \
    apt-get install -y vim && \
            apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


WORKDIR /app

COPY package.json /app
RUN npm install
RUN npm install bcrypt

COPY . /app

RUN npm run build
CMD npm start
EXPOSE 3003
