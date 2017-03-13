FROM python:2-alpine

ENV TREADS=1000 \
    PAGES=2 \
    DIR=/opt

RUN apk --no-cache add --update \
      git \
      bash \
      curl \
      gcc \
      musl-dev \
      libxml2-dev \
      parallel \
    && apk --no-cache add 'libxslt-dev' --update-cache --repository http://nl.alpinelinux.org/alpine/edge/main \
    && mkdir -p /usr/include/libxml \
    && ln -s /usr/include/libxml2/libxml/xmlversion.h /usr/include/libxml/xmlversion.h \
    && ln -s /usr/include/libxml2/libxml/xmlexports.h /usr/include/xmlexports.h \
    && ln -s /usr/include/libxml2/libxml/xmlexports.h /usr/include/libxml/xmlexports.h \
    && git clone https://github.com/kirmarchenko/pyproxyhunter.git \
    && cd /pyproxyhunter \
    && pip install -r requirements.txt \
    && rm -rf /root/..?* /root/.[!.]* /root/* /tmp/*

COPY proxy_check.sh entrypoint.sh /pyproxyhunter/

VOLUME /opt

WORKDIR /pyproxyhunter

ENTRYPOINT ["./entrypoint.sh"]
