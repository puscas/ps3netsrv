FROM resin/rpi-raspbian:jessie-20161221

RUN apt-get update && \
 apt-get install build-essential && \
 apt-get install git && \
 apt-get clean

RUN mkdir /games && \
 mkdir /tools

RUN git clone -b pi https://github.com/puscas/ps3netsrv.git /tools/ps3netsrv && \
 cd /tools/ps3netsrv && \
 make && \
 chmod +x ./ps3netsrv

VOLUME ["/games"]

EXPOSE 38008

ENTRYPOINT ["/tools/ps3netsrv/ps3netsrv", "/games", "38008"]
CMD ["192.168.1.*"]
