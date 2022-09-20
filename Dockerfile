FROM python:3.9 as base

ARG PACKAGE_NAME="web-powerml"

RUN apt-get -yq update && \
    apt-get install -yqq npm

WORKDIR /app/${PACKAGE_NAME}

COPY ./package.json /app/${PACKAGE_NAME}/package.json
COPY ./nuxt.config.js /app/${PACKAGE_NAME}/nuxt.config.js

# install dependencies from package.json
RUN npm install

# install npm
COPY scripts /app/${PACKAGE_NAME}/scripts

# Setup the entrypoint
RUN chmod a+x /app/${PACKAGE_NAME}/scripts/start.sh

ENV PACKAGE_NAME=$PACKAGE_NAME
ENTRYPOINT /app/${PACKAGE_NAME}/scripts/start.sh

