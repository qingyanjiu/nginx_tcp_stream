FROM alpine:3.8
USER root
RUN mkdir nginx
WORKDIR /root/nginx
RUN apk update && apk add unzip gcc g++ pcre pcre-dev openssl openssl-dev make
RUN wget http://nginx.org/download/nginx-1.12.0.tar.gz
RUN tar -xf nginx-1.12.0.tar.gz
WORKDIR /root/nginx/nginx-1.12.0
RUN ./configure --with-http_stub_status_module --with-stream
RUN make && make install
ADD nginx.conf /usr/local/nginx/conf/nginx.conf
EXPOSE 80
CMD /usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
