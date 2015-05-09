#!/bin/bash

if [ -z "$TOKEN" ]; then
  echo "Missing \$TOKEN"
  exit 1
fi

if [ -z "$TAG" ]; then
  echo "Missing \$TAG"
  exit 1
fi

# INSERT Token
sed -i "s/TOKEN/$TOKEN/" /etc/rsyslog.d/50-default.conf
sed -i "s/TAG/$TAG/" /etc/rsyslog.d/50-default.conf

# Disable "system" logging
sed -i 's@^\(\$Mod.*imuxsock.*\)@# \1@;s@^\(\$Mod.*imklog.*\)@# \1@;s@^\(\$KLogPermitNonKernelFacility.*\)@# \1@' /etc/rsyslog.conf

exec /usr/sbin/rsyslogd -n

