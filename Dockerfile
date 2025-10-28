FROM node:20-alpine

# Install compose dependencies
RUN apk add --no-cache bash curl docker-cli docker-compose
  
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --only=production

COPY . .
EXPOSE 80
CMD ["node", "build/index.js"]
