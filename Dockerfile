# Import node environment
FROM node:carbon

# Create app directory
WORKDIR /app

# Copy in dependency list
COPY package*.json ./

RUN npm install

WORKDIR /app/src

COPY ./src .

EXPOSE 3000

CMD ["npm", "start"]