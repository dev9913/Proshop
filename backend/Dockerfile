FROM node:18-alpine

WORKDIR /app

ENV NODE_ENV=development
ENV PORT=5000
ENV MONGO_URI=mongodb://mongo:27017/proshop
ENV JWT_SECRET=abc123
#ENV PAYPAL_CLIENT_ID=your_paypal_client_id

COPY package.*json ./
RUN npm install

COPY . .

EXPOSE 5000

CMD ["npm","start"]


