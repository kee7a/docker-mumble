FROM alpine:edge
MAINTAINER Jeff Siqueira <root@kee7a.com>

RUN apk add --update murmur icu-libs && rm -rf /var/cache/apk/*

RUN addgroup \
    -S -g 1000 \
    mumble && \
  adduser \
    -S -H -D \
    -h /data \
    -s /bin/sh \
    -u 1000 \
    -G mumble \
    mumble

VOLUME ["/data/config"]
VOLUME ["/data/db"]
VOLUME ["/data/cert"]

EXPOSE 64738/udp 
EXPOSE 64738/tcp

USER mumble

ENTRYPOINT ["/usr/bin/murmurd", "-fg", "-ini", "/data/config/mumble-server.ini"]


#docker run -d -v /home/luna/mumble:/data --name mumble-server -p 64738:64738/tcp -p 64738:64738/udp kee7a/mumble:1.2.19-a

#add shit for certs?