# Dockerfile for whatsapp_messaging_service backend (node.js)
# Generated: 2026-03-03T22:54:34.415984

FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
ENV NODE_ENV=production
EXPOSE 3000
USER node
CMD ["node", "dist/main.js"]
