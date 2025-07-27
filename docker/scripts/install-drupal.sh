#!/bin/bash

cd /var/www/html

# If site not already installed
if [ ! -f "index.php" ]; then
  composer create-project drupal/recommended-project .
  vendor/bin/drush site-install standard \
    --db-url=mysql://$DB_USER:$DB_PASSWORD@$DB_HOST/$DB_NAME \
    --account-name=admin \
    --account-pass=admin123 \
    --site-name="Docker Drupal Site" \
    --yes
fi

exec apache2-foreground

