ARG ALPINE_VER=3.17.2
FROM alpine:$ALPINE_VER

ARG APK_PROXY
RUN if [ -n "$APK_PROXY" ]; then \
  cp /etc/apk/repositories /etc/apk/repositories.bak && \
  sed -i "s|dl-cdn.alpinelinux.org|$APK_PROXY|g" /etc/apk/repositories ; \
  fi

RUN apk add --no-cache curl bash gawk

WORKDIR /app

COPY gh-md-toc .

RUN chmod +x gh-md-toc

ENTRYPOINT ["./gh-md-toc"]
CMD ["/app/README.md"]
