FROM python:3.6-alpine3.6

RUN adduser -D -u 101 uwsgi

ENV PYCURL_SSL_LIBRARY=openssl

WORKDIR /usr/src/app

RUN apk update && apk upgrade

RUN apk add linux-headers libc-dev gcc bash pcre pcre-dev curl-dev openssl-dev git openssl

RUN pip install flask uwsgi

COPY ./uwsgi/uwsgi.ini /

VOLUME ["/usr/src/app", "/tmp/"]

CMD ["uwsgi", "/uwsgi.ini"]
