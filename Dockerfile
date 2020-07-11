FROM alpine:3.12
RUN apk --update add exiftool && \
    rm -rf /var/cache/apk/*
RUN addgroup -S app && adduser -S app -G app
RUN mkdir /home/app/storage
USER app
WORKDIR /home/app/storage
ENTRYPOINT [ "exiftool" ]
