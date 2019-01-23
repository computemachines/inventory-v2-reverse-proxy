FROM alpine

RUN apk update && apk add nginx bash curl openssl ca-certificates acme-client libressl git socat
RUN openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 4096

RUN rm -v /etc/nginx/conf.d/default.conf

COPY inventory-app-nginx.conf /etc/nginx/conf.d/
COPY start_nginx.sh /bin/

RUN mkdir -pv /run/nginx

# CMD ["nginx", "-g", "daemon off;"]
CMD nginx ; tail -f /dev/null
# CMD ["sh", "/bin/start_nginx.sh"]

