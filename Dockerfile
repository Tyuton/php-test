# Use official PHP image with Apache
FROM php:8.2-apache

# Install necessary PHP extensions (customize based on your project)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite (often needed for PHP frameworks)
RUN a2enmod rewrite

# Copy your PHP project into the container
COPY . /var/www/html/

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose HTTP port
EXPOSE 80
