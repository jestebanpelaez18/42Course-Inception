FROM alpine:3.18

# Create user and group
RUN addgroup -S www && adduser -S -H -G www www

# Update and install dependencies
RUN apk update && \
    apk add --no-cache \
    wget php81 mariadb-client \
    curl bash \
    php81-mysqli php81-json php81-openssl \
    php81-cgi php81-fpm


EXPOSE 9000

# Create necessary directories
RUN mkdir -p /run/php/ /var/www/html/wordpress/

# Copy the PHP-FPM configuration file
COPY conf/www.conf /etc/php81/php-fpm.d/www.conf

COPY ./script/wordpress.sh /
RUN chmod +x wordpress.sh


CMD ["sh", "/wordpress.sh"]