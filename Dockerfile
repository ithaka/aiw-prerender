# Import node environment
FROM node:carbon

# Create app directory
WORKDIR /usr/src/app

# Copy in dependency list
COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5555

CMD ["npm", "start"]