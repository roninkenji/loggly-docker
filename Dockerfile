#################################################################
#
#                    ##        .
#              ## ## ##       ==
#           ## ## ## ##      ===
#       /""""""""""""""""\___/ ===
#  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
#       \______ o          __/
#         \    \        __/
#          \____\______/
#
#################################################################

FROM ubuntu:trusty
MAINTAINER roninkenji

RUN apt-get update
RUN apt-get -y dist-upgrade

ADD run.sh /tmp/run.sh
RUN chmod +x /tmp/run.sh
ADD 50-default.conf /etc/rsyslog.d/50-default.conf

EXPOSE 514 514/udp

CMD ["/tmp/run.sh"]

