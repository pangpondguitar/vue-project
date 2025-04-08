# Step 1: Build Vue App
FROM node:latest AS builder

# install simple http server for serving static content
RUN npm install -g http-server

WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

# Step 2: Use nginx to serve build folder
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
