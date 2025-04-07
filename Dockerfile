FROM node:latest

# install simple http server for serving static content
RUN npm install -g http-server

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY . .

# install project dependencies
RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)


# build app for production with minification
RUN npm run build

# Step 2: Use nginx to serve build folder
FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html
EXPOSE 8080  
CMD ["nginx", "-g", "daemon off;"]