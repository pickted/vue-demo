FROM node:18-alpine

CMD["pwd"]
CMD["ls"]

WORKDIR /vue-app
COPY public/ /vue-app/public
COPY src/ /vue-app/src
COPY package.json/ /vue-app/package.json

RUN npm install

CMD ["npm", "serve"]