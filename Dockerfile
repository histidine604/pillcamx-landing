# Stage 1: Build the React app
FROM node:16-alpine AS build

WORKDIR /app/client

COPY client/package.json .

RUN npm install

COPY client/ .

RUN npm run build

# Stage 2: Setup the server
FROM node:16-alpine

WORKDIR /app

COPY server/package.json .

RUN npm install

COPY server/ .

# Copy the built React app from the previous stage
COPY --from=build /app/client/build ./client/build

EXPOSE 5000

CMD ["npm", "start"]