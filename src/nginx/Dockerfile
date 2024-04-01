FROM alpine:3.18

#Install ngix and openssl, directory to save ssl keys and certificates, and the runtime file 
#ngix   

RUN apk update &&\
 apk add --no-cache nginx openssl &&\ 
mkdir -p /run/nginx /etc/nginx/ssl

# Create the SSL key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/certificates.key \
-out /etc/nginx/ssl/certificates.crt \
-subj "/C=FI/ST=Helsinki/O=Hive/ CN=jpelaez" 

#RUN 

# We copy our configuration file in our current working directory
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

#All the permissions
RUN chmod +x /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]