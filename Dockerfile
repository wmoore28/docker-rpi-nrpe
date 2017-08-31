FROM arm32v7/debian:latest

LABEL org.label-schema.cvs-url="https://github.com/wmoore28/docker-rpi-nrpe"

ENV http_proxy=http://jprox.jlab.org:8081

RUN apt-get update && apt-get install -y \
        nagios-nrpe-server \
        supervisor \
    && rm -rf /var/lib/apt/lists/*
RUN echo "allowed_hosts=127.0.0.1, 129.57.32.206" >> /etc/nagios/nrpe_local.cfg \
    && echo "dont_blame_nrpe=1" >> /etc/nagios/nrpe_local.cfg

COPY start.sh /
RUN chmod +x /start.sh

EXPOSE 5666

CMD ["/start.sh"]
