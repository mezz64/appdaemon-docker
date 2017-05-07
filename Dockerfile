FROM python:3.6

MAINTAINER mezz64 <jtmihalic@gmail.com>

RUN apt-get update && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
VOLUME /conf

# Grab source
RUN git clone -b hadashboard_beta https://github.com/home-assistant/appdaemon.git .

# INSTALL
#RUN pip3 install daemonize configparser astral 'requests>=2.6.0' && \
#    pip3 install sseclient websocket-client async aiohttp==1.2.0 && \
#    pip3 install Jinja2==2.9.5 aiohttp_jinja2 pyScss pyyaml voluptuous
    
RUN pip3 install .

CMD [ "appdaemon", "-c", "/conf" ]
