#Node server
FROM node:16-alpine as node-server
WORKDIR /usr/src/app
COPY ./package.json .
RUN npm install --production --silent && mv node_modules ../
COPY index.js .

#Final image
FROM node:12-alpine
WORKDIR /usr/src/app
COPY --from=node-server /usr/src /usr/src
EXPOSE 8080
CMD ["node","index.js"]