# Use an official Node.js runtime as a parent image
FROM node:latest

# Set the working directory within the container
WORKDIR /app

# Copy the package.json and package-lock.json files into the container
COPY package*.json ./

# Install the Angular CLI and project dependencies
RUN npm install -g @angular/cli && npm install

# Copy the rest of the application code into the container
COPY . .

# Build the Angular application for production
RUN ng build --prod

# Expose port 80 to allow external access to the application
EXPOSE 4200

# Start the Angular application when the container is run
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4200"]
