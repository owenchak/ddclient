FROM alpine:3.9

RUN apk update && \
    apk upgrade && \
    apk add --no-cache tzdata bash unzip make perl perl-utils \
                       perl-test-taint perl-netaddr-ip perl-net-ip \
                       perl-yaml perl-log-log4perl \
                       perl-io-socket-ssl

RUN cpan Data::Validate::IP

RUN cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    echo "America/Sao_Paulo" > /etc/timezone

RUN mkdir /ddclient

COPY ddclient-3.9.0.zip /ddclient/.

RUN unzip -qq /ddclient/ddclient-3.9.0.zip -d /ddclient/. && \
    rm /ddclient/ddclient-3.9.0.zip && \
    mv /ddclient/ddclient-3.9.0/ddclient /usr/bin/. && \
    rm -rf /ddclient/ddclient-3.9.0 && \
    chmod +x /usr/bin/ddclient && \
    mkdir /etc/ddclient && \
    mkdir /var/cache/ddclient

COPY entrypoint.sh /ddclient/.

RUN chmod +x /ddclient/entrypoint.sh

CMD ["./ddclient/entrypoint.sh"]
