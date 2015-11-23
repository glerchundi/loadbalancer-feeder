FROM quay.io/justcontainers/base-alpine:v0.10.0
MAINTAINER Gorka Lerchundi Osa <glertxundi@gmail.com>

##
## INSTALL
##

# gnu tar, please
RUN apk-install tar

# kubelistener
ADD https://github.com/glerchundi/kubelistener/releases/download/v0.3.0/kubelistener-linux-amd64 /usr/bin/kubelistener
RUN chmod 0755 /usr/bin/kubelistener

# jq
ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /usr/bin/jq
RUN chmod 0755 /usr/bin/jq

# etcdctl
ADD https://github.com/coreos/etcd/releases/download/v2.2.1/etcd-v2.2.1-linux-amd64.tar.gz /tmp/etcd.tar.gz
RUN tar xvfz /tmp/etcd.tar.gz -C /usr/bin --strip 1 --wildcards --no-anchored 'etcdctl' && rm /tmp/etcd.tar.gz

##
## ROOTFS
##

COPY rootfs /
RUN s6-rmrf /etc/s6/services/s6-fdholderd/down
