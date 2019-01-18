FROM phusion/baseimage:latest
LABEL maintainer="marda.firmansyah@zenofa.com"

# Tell the container there is no tty
ENV DEBIAN_FRONTEND noninteractive

ENV DEFAULT_CONTAINER_TIMEZONE Asia/Jakarta

# Automatic choose local mirror for sources list
COPY sources.list /etc/apt/sources.list

# Update to latest packages and tidy up
RUN apt-get update \
&& apt-get -y upgrade \
&& apt-get install -y apt-utils tzdata iputils-ping \
&& apt-get -y autoremove \
&& apt-get -y clean \
&& rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

COPY . /app

RUN chmod +x /app/bin/*

RUN ln -s /app/bin/set_timezone.sh /etc/my_init.d/00_set_timezone.sh