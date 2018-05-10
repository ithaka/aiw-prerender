# Import node environment
# FROM node:carbon

FROM ubuntu:latest

### BELOW THIS IS GOOD

RUN apt-get update
RUN apt-get install -my wget gnupg
RUN apt-get install curl -y
RUN apt-get install sudo -y

# install that node
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# install chrome - don't worry about the apparent failure
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN sudo dpkg -i google-chrome-stable_current_amd64.deb || echo '\ninstall failed - but its fine we just wanted a dependency list\n'
RUN sudo apt-get -f install -y
RUN sudo dpkg -i google-chrome-stable_current_amd64.deb

### BELOW THIS IS TRIED

# RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# RUN echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
# RUN apt-get install google-chrome-stable -y

# RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
# RUN sudo apt-get install -y nodejs

# Set up node and npm install libraries.
# ENV NODE_VERSION=v8.10.0
# RUN wget https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz
# RUN xz -dc node-${NODE_VERSION}-linux-x64.tar.xz | tar xf - -C /usr/local/

# RUN export PATH=$PATH:/usr/local/node-${NODE_VERSION}-linux-x64/bin

# Create app directory
WORKDIR /app

# Copy in dependency list
COPY package*.json ./

RUN npm install

COPY ./src ./src

EXPOSE 3000

CMD ["npm", "start"]