#!/usr/bin/env bash

echo "Change Timezone to ${CONTAINER_TIMEZONE:-$DEFAULT_CONTAINER_TIMEZONE}"
unlink /etc/localtime
ln -fs /usr/share/zoneinfo/${CONTAINER_TIMEZONE:-$DEFAULT_CONTAINER_TIMEZONE} /etc/localtime
dpkg-reconfigure tzdata