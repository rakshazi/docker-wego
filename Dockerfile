FROM golang:alpine

MAINTAINER Nikita Chernyi <developer.nikus@gmail.com>

RUN apk add --no-cache git && \
    go get github.com/schachmat/wego && \
    apk del git

COPY entry.sh /entry.sh
RUN chmod +x /entry.sh
WORKDIR /
ENTRYPOINT ["/entry.sh"]
