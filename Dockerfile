# Import node environment
FROM node:carbon

# Create app directory
WORKDIR /usr/src/app

# Copy in dependency list
COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]