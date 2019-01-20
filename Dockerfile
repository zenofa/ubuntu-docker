FROM phusion/baseimage:0.11

LABEL maintainer="marda.firmansyah@zenofa.com"

# Tell the container there is no tty
ENV DEBIAN_FRONTEND noninteractive

ENV DEFAULT_CONTAINER_TIMEZONE Asia/Jakarta

# Automatic choose local mirror for sources list
COPY sources.list /etc/apt/sources.list

# Update to latest packages and tidy up
RUN apt-get update \
&& apt-get upgrade -y -o Dpkg::Options::="--force-confold" \
&& apt-get install -y apt-utils tzdata iputils-ping \
&& apt-get -y autoremove \
&& apt-get -y clean \
&& rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

COPY . /app

RUN chmod a+x /app/bin/*.sh && \
/app/bin/set_timezone.sh

RUN lsb_release -crid