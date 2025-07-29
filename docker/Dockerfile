# Dockerfile
FROM drupal:10-apache

# Install dependencies
FROM drupal:10-apache

# Install dependencies and PHPUnit
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/* \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && composer global require phpunit/phpunit \
    && ln -s /root/.composer/vendor/bin/phpunit /usr/local/bin/phpunit

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
