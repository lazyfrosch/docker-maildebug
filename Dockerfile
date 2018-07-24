FROM debian:stretch

RUN DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install --no-install-recommends -y \
    postfix \
	supervisor \
	sysvinit-utils \
	busybox-syslogd \
 && rm -rf /var/lib/apt/lists/*

COPY files/ /

EXPOSE 25

ENTRYPOINT [ "/docker-entrypoint" ]
CMD [ "supervisord" ]
