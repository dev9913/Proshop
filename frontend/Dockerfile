FROM node:18-alpine

WORKDIR /app

ENV SKIP_PREFLIGHT_CHECK=true
ENV NODE_OPTIONS=--openssl-legacy-provider

COPY package.*json ./
Run npm install

COPY . .
RUN npm run build

EXPOSE 3000

CMD ["npm","start"]

