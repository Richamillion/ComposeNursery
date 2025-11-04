FROM node:20-alpine

# Install compose dependencies
RUN apk add --no-cache bash curl docker-cli docker-compose

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

EXPOSE 80
CMD ["node", "build/index.js"]
