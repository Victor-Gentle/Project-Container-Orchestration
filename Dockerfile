# Use NGINX base image
FROM nginx:latest

# Set the working directory
WORKDIR /usr/share/nginx/html

# Copy HTML and CSS files to NGINX default public directory
COPY index.html /usr/share/nginx/html
COPY styles.css /usr/share/nginx/html

# Expose port 80
EXPOSE 80

