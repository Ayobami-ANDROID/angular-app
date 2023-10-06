# Stage 1

FROM node:10-alpine as build-step

RUN mkdir -p /app

WORKDIR /app

COPY package*.json /app

RUN npm install

COPY . /app

RUN npm  build

# Stage 2

FROM nginx:latest

COPY --from=build-step /app/dist/my-angular-app /usr/share/nginx/html

EXPOSE 80