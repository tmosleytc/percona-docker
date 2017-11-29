FROM debian:jessie
MAINTAINER Percona Development Team <opensource-dev@percona.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
                apt-transport-https ca-certificates \
                pwgen wget \
        && rm -rf /var/lib/apt/lists/*
RUN wget https://repo.percona.com/apt/percona-release_0.1-4.jessie_all.deb
RUN dpkg -i percona-release_0.1-4.jessie_all.deb


RUN echo 'deb https://repo.percona.com/apt jessie testing' > /etc/apt/sources.list.d/percona.list

# the numeric UID is needed for OpenShift
RUN groupadd -r mongodb && useradd -r -g mongodb -s /sbin/nologin \
            -c "Default Application User" mongodb

ENV PERCONA_MAJOR 34


RUN \
        apt-get update \
        && apt-get install -y --force-yes \
           percona-server-mongodb-$PERCONA_MAJOR \
        && rm -rf /var/lib/apt/lists/* \
        && rm -rf /data/db && mkdir -p /data/db \ 
        && chown -R mongodb:mongodb /data/db

VOLUME ["/data/db"]


COPY ps-entry.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


EXPOSE 27017

CMD ["mongod"]

