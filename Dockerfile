FROM node:lts-buster

WORKDIR /app

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json.
RUN npm install && npm install qrcode-terminal --save

COPY..

EXPOSE 3000

CMD ["node", "index.js", "--server"]
