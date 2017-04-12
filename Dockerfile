FROM alpine:3.5

ENV OAUTH2_PROXY_URL \
  https://github.com/bitly/oauth2_proxy/releases/download/v2.1/oauth2_proxy-2.1.linux-amd64.go1.6.tar.gz

RUN apk add --update ca-certificates openssl \
  && wget -O - $OAUTH2_PROXY_URL \
   | tar -C /usr/bin --strip-components 1 -xzf -

ENTRYPOINT [ "oauth2_proxy" ]
