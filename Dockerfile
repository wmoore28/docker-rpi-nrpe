FROM arm32v7/debian:latest

ENV http_proxy=http://jprox.jlab.org:8081

RUN apt-get update \
    && apt-get install -y \
        nagios-nrpe-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN echo "allowed_hosts=127.0.0.1, 129.57.32.206" >> /etc/nagios/nrpe_local.cfg \
    && echo "dont_blame_nrpe=1" >> /etc/nagios/nrpe_local.cfg

#EXPOSE 5666
#CMD ["/etc/init.d/nagios-nrpe-server start"]
