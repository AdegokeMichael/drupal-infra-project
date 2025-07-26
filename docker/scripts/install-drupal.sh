#!/bin/bash

echo "✅ Starting Drupal installation script..."

# Ensure Apache and PHP are running (if needed)
service apache2 restart

# Check if Drupal is already installed
if [ -f /var/www/html/drupal/sites/default/settings.php ]; then
    echo "⚠️  Drupal already appears to be installed. Skipping install."
else
    echo "🚀 Setting permissions..."
    chown -R www-data:www-data /var/www/html/drupal
    chmod -R 755 /var/www/html/drupal

    echo "🎯 Running Drupal site installation..."
    cd /var/www/html/drupal

    # This assumes `drush` is installed — if not, remove this block or install drush first
    if command -v drush >/dev/null 2>&1; then
        drush site:install standard \
          --db-url=mysql://${DRUPAL_DB_USER}:${DRUPAL_DB_PASSWORD}@${DRUPAL_DB_HOST}/${DRUPAL_DB_NAME} \
          --site-name="Drupal HA Site" \
          --account-name=admin \
          --account-pass=admin \
          --yes
    else
        echo "⚠️  Drush not installed. Manual setup required in browser."
    fi
fi

echo "✅ Drupal install script completed."

