FROM node:18-alpine



WORKDIR /vue-app
COPY public/ /vue-app/public
COPY src/ /vue-app/src
COPY package.json/ /vue-app/package.json

RUN npm install
RUN pwd
RUN ls

EXPOSE 3000

CMD ["npm", "run", "serve"]