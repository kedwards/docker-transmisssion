FROM alpine:latest

MAINTAINER kedwards <kedwards@kevinedwards.ca>

RUN apk upgrade --update --available && \
  apk add bash nano transmission-daemon && \
  rm -rf /var/cache/apk/* && \
  mkdir -p /root/.config/transmission-daemon

ADD settings.json /root/.config/transmission-daemon/

EXPOSE 8080 64388

VOLUME /Torrents

ENTRYPOINT ["transmission-daemon", "-f"]
