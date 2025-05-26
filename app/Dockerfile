# Use the official Nginx image
FROM nginx:alpine

# Set working directory to Nginx's web root
WORKDIR /usr/share/nginx/html

# Copy custom HTML files into the container
COPY index-aws.html .
COPY index-azure.html .

# Expose HTTP port
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
