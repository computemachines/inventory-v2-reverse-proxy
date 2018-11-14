FROM alpine

RUN apk update && apk add nginx bash curl openssl ca-certificates

RUN rm -v /etc/nginx/conf.d/default.conf

COPY inventory-app-nginx.conf /etc/nginx/conf.d/

RUN mkdir -pv /run/nginx

CMD ["nginx", "-g", "daemon off;"]
