# Import node environment
# FROM node:carbon

FROM ubuntu:latest

RUN apt-get update
RUN apt-get install wget -y
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
RUN apt-get install google-chrome-stable -y

RUN curl -sL https://deb.nodesource.com/setup_8.x | -E bash -
RUN apt-get install -y nodejs

# Set up node and npm install libraries.
# ENV NODE_VERSION=v8.10.0
# RUN wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz
# RUN xz -dc node-${NODE_VERSION}-linux-x64.tar.xz | tar xf - -C /usr/local/

# RUN export PATH=$PATH:/usr/local/node-${NODE_VERSION}-linux-x64/bin

# Create app directory
WORKDIR /app

# Copy in dependency list
COPY package*.json ./

# RUN npm install

WORKDIR /app/src

COPY ./src .

EXPOSE 3000

# CMD ["npm", "start"]