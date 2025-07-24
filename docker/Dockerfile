FROM php:8.1-apache

# Install PHP extensions required for Drupal
RUN apt-get update && apt-get install -y \
    libzip-dev unzip git curl libonig-dev mariadb-client \
    && docker-php-ext-install pdo pdo_mysql zip

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy entrypoint script if needed
COPY scripts/install-drupal.sh /usr/local/bin/install-drupal.sh
RUN chmod +x /usr/local/bin/install-drupal.sh

# Expose port
EXPOSE 80
