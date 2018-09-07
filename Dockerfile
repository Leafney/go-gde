FROM alpine:3.8
MAINTAINER leafney "babycoolzx@126.com"

RUN apk update && \
    apk add python supervisor tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /app && \
    rm -rf /var/cache/apk/* && \
    echo "files = /app/conf/*.ini" >> /etc/supervisord.conf

COPY ./app /app

VOLUME ["/app"]
EXPOSE 8080

CMD ["supervisord","--nodaemon","-c","/etc/supervisord.conf"]