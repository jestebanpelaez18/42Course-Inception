FROM alpine:3.18

# Update and install dependencies
RUN apk update && \
    apk add --no-cache \
    wget php81 mariadb-client \
    curl bash \
    php81-mysqli php81-json php81-openssl \
    php81-cgi php81-fpm

# Create user and group
RUN addgroup -S www && adduser -S -H -G www www

# Create necessary directories
RUN mkdir -p /run/php/ && mkdir -p /var/www/html/wordpress/

COPY script/wordpress.sh /tmp/wordpress.sh
RUN chmod +x /tmp/wordpress.sh

# Copy the PHP-FPM configuration file
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf


EXPOSE 9000

CMD ["sh", "/tmp/wordpress.sh"]