FROM quay.io/justcontainers/base:v0.6.0
MAINTAINER Gorka Lerchundi Osa <glertxundi@gmail.com>

##
## INSTALL
##

# kubelistener
ADD https://github.com/glerchundi/kubelistener/releases/download/v0.1.0/kubelistener-0.1.0-linux-amd64 /usr/bin/kubelistener
RUN chmod 0755 /usr/bin/kubelistener

# jq
ADD http://stedolan.github.io/jq/download/linux64/jq /usr/bin/jq
RUN chmod 0755 /usr/bin/jq

# etcdctl
ADD https://github.com/coreos/etcd/releases/download/v2.0.10/etcd-v2.0.10-linux-amd64.tar.gz /tmp/etcd.tar.gz
RUN tar xvfz /tmp/etcd.tar.gz -C /usr/bin --strip 1 --wildcards --no-anchored 'etcdctl'

##
## ROOTFS
##

COPY rootfs /
RUN s6-rmrf /etc/s6/services/s6-fdholderd/down

##
## CLEANUP
##

RUN apt-cleanup
