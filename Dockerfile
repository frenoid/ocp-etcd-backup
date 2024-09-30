FROM alpine:3.19.1

ARG OC_VERSION=4.13.15

LABEL author="Lim Xing Kang Norman<frenoid@gmail.com>"
LABEL repository="https://github.com/frenoid/ocp-etcd-backup"

COPY oc-$OC_VERSION-linux.tar.gz .

RUN tar xvf oc-$OC_VERSION-linux.tar.gz

RUN cp ./oc /usr/local/bin/oc

RUN rm oc-$OC_VERSION-linux.tar.gz

RUN apk update

# Needed to run the oc binary
RUN apk add gcompat==1.1.0-r4

RUN apk add aws-cli>=2.13.25

# Fix vulnerabilities
RUN apk upgrade \
  busybox>1.36.1-r19 \
  python3>3.11.10-r0


RUN rm -rf /var/cache/apk/*

# 
