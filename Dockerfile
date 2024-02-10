# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package lists and install Apache2
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the custom index.html to the default Apache2 document root
COPY . /var/www/html/

# Start Apache2 automatically when the container starts
CMD ["apache2ctl", "-D", "FOREGROUND"]

# Expose port 80 to allow external access
EXPOSE 80
