# Use an official Node.js image as the base image
FROM node:14-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files to the working directory
COPY . .

# Build the React application
RUN npm run build

# Use a smaller, production-ready image for the final container
FROM nginx:alpine

# Copy the built files from the previous stage to the NGINX HTML directory
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80 (default port for NGINX)
EXPOSE 80

# Start NGINX server when the container starts
CMD ["nginx", "-g", "daemon off;"]
