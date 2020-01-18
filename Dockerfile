FROM leafney/alpine:3.11
LABEL maintainer="leafney <babycoolzx@126.com>"

RUN apk add --no-cache python supervisor && \
    mkdir -p /app && \
    echo "files = /app/conf/*.ini" >> /etc/supervisord.conf

COPY ./app /app

VOLUME ["/app"]
EXPOSE 8080

CMD ["supervisord","--nodaemon","-c","/etc/supervisord.conf"]