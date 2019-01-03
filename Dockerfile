FROM alpine

RUN apk update && apk add nginx bash curl openssl ca-certificates acme-client libressl git socat
RUN git clone https://github.com/Neilpang/acme.sh.git
RUN cd /acme.sh/; ./acme.sh --install

RUN rm -v /etc/nginx/conf.d/default.conf

COPY inventory-app-nginx.conf /etc/nginx/conf.d/
COPY start_nginx.sh /bin/

RUN mkdir -pv /run/nginx

RUN openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 4096

CMD ["sh", "/bin/start_nginx.sh"]

