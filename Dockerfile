FROM alpine:3.12
RUN apk --update add exiftool && \
    rm -rf /var/cache/apk/*
WORKDIR /tmp
ENTRYPOINT [ "exiftool" ]
