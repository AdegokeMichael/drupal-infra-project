# Dockerfile
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
RUN chown -R www-data:www-data /var/www/html
