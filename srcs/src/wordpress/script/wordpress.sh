#!/bin/sh

#Wait for MariaDB to be ready
while ! wget --spider -q mariadb:3306; do
    sleep 5
done
echo "MariaDB connection established!"

echo "Listing databases:"

# Set working dir
cd /var/www/html/wordpress/

# Download WP cli
wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp

# Make it executable
chmod +x /usr/local/bin/wp

# DL WP using the CLI
wp core download --allow-root

# Create WordPress database config
wp config create \
	--dbname=$MARIA_DB_NAME \
	--dbuser=$MARIA_DB_USER \
	--dbpass=$MARIA_DB_PASSWORD \
	--dbhost=$MYSQL_HOST \
	--path=/var/www/html/wordpress/ \
	--force

# Install WordPress and feed db config
wp core install \
	--url=$DOMAIN_NAME \
	--title=$WORDPRESS_TITLE \
	--admin_user=$WORDPRESS_ADMIN_USER \
	--admin_password=$WORDPRESS_ADMIN_PASSWORD \
	--admin_email=$WORDPRESS_ADMIN_EMAIL \
	--allow-root \
	--skip-email \
	--path=/var/www/html/wordpress/

echo holaa
# Create WordPress user
wp user create \
	$WORDPRESS_USER \
	$WORDPRESS_EMAIL \
	--role=author \
	--user_pass=$WORDPRESS_PASSWORD \
	--allow-root
echo hola222
# Install theme for WordPress
wp theme install neve\
	--activate \
	--allow-root

# Update plugins
wp plugin update --all

# Update WP address and site address to match our domain
wp option update siteurl "https://$DOMAIN_NAME" --allow-root
wp option update home "https://$DOMAIN_NAME" --allow-root

# Transfer ownership to the user
chown -R www:www /var/www/html/wordpress

# Full permissions for owner, read/exec to others
chmod -R 755 /var/www/html/wordpress

# Fire up PHP-FPM (-F to keep in foreground and avoid recalling script)
php-fpm81 -F