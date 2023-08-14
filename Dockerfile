FROM alpine:3.18 as builder
LABEL stage=go-builder
WORKDIR /app/
COPY ./ ./
RUN apk add --no-cache bash curl gcc git go musl-dev; \
    bash build.sh release docker

FROM xiaoyaliu/alist:latest

LABEL MAINTAINER="Har01d"

COPY --from=builder /app/bin/alist ./
