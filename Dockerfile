FROM python:3.4

MAINTAINER mezz64 <jtmihalic@gmail.com>

RUN apt-get update && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
VOLUME /conf

# Grab source
#COPY . .
RUN git clone https://github.com/acockburn/appdaemon.git .

# INSTALL
# add appdaemon python helpers
#RUN pip3 install daemonize sseclient configparser astral
RUN pip3 install .

CMD [ "appdaemon", "-c", "/conf/appdaemon.cfg" ]
#CMD ["/start.sh"]
