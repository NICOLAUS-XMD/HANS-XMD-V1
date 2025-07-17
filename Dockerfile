FROM node:lts-buster

# Weka directory ya kazi ndani ya container
WORKDIR /app

# Update na install dependencies
RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

# Nakili package.json hadi /app
COPY package.json /app/

# Install dependencies
RUN npm install && npm install qrcode-terminal --save

# Nakili files zote hadi /app
COPY. /app/

# Fungua port 3000
EXPOSE 3000

# Anzisha server
CMD ["node", "index.js", "--server"]
