FROM alpine:3.18

#Install ngix and openssl, directory to save ssl keys and certificates, and the runtime file 
#ngix   

RUN apk update &&\
 apk add --no-cache nginx openssl &&\ 
mkdir -p /run/nginx /etc/nginx/ssl

EXPOSE 443

# Create the SSL key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/certificates.key \
-out /etc/nginx/ssl/certificates.crt \
-subj "/C=FI/ST=Helsinki/O=Hive/ CN=jpelaez-" 

RUN     addgroup -S www && \
	adduser -S -H -g "" www -G www && \
	mkdir /www && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www 

# We copy our configuration file in our current working directory
COPY conf/nginx.conf /etc/nginx/nginx.conf

#All the permissions
RUN chmod +x /etc/nginx/nginx.conf

CMD ["nginx", "-c", "/etc/nginx/nginx.conf" ,"-g", "daemon off;"]