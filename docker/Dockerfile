FROM php:8.1-apache

# Install PHP extensions required for Drupal
RUN apt-get update && apt-get install -y \
    libzip-dev unzip git # Dockerfile
FROM drupal:10-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install Drush (Drupal shell)
RUN php -r "readfile('https://sites.drupal.org/files/drush.phar');" > drush \
    && chmod +x drush \
    && mv drush /usr/local/bin

# Set working directory
WORKDIR /var/www/html

# Copy custom modules/themes if needed
# COPY ./modules ./modules
# COPY ./themes ./themes

# Set permissions
RUN chown -R www-data:www-data /var/www/htmlcurl libonig-dev mariadb-client \
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
