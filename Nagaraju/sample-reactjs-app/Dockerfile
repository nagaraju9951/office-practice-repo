
FROM node:16.8.0
WORKDIR /app
COPY package.json ./
COPY ./ ./
RUN npm install
CMD ["npm", "run", "start"]
