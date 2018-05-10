# ubuntu environment with node 8.10 and latest chrome
FROM corbfon/node-chrome:latest

# Create app directory
WORKDIR /app

# Copy in dependency list
COPY package*.json ./

RUN npm install

COPY ./src ./src

EXPOSE 3000

CMD ["npm", "start"]