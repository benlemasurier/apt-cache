#
# Build: docker build -t apt-cache .
# Run: docker run -d -p 3142:3142 --name apt-cache apt-cache
#
# clients: create /etc/apt/apt.conf.d/01proxy and add the following line:
# Acquire::http { Proxy "http://<host ip>:3142"; };
#
FROM ubuntu
MAINTAINER Ben LeMasurier <ben@crypt.ly>

EXPOSE 3142

VOLUME ["/var/cache/apt-cacher-ng"]

RUN apt-get update && \
    apt-get install -y apt-cacher-ng

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
