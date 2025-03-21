FROM alpine:3.19.1

ARG OC_VERSION=4.14.34

LABEL author="Lim Xing Kang Norman<frenoid@gmail.com>"
LABEL repository="https://github.com/frenoid/ocp-etcd-backup"


WORKDIR /app

COPY . .

RUN wget https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/$OC_VERSION/openshift-client-linux-$OC_VERSION.tar.gz --output-document=openshift-client-linux-$OC_VERSION.tar.gz

RUN tar xvf ./openshift-client-linux-$OC_VERSION.tar.gz

RUN cp ./oc /usr/local/bin/oc

RUN cp ./kubectl /usr/local/bin/kubectl

RUN rm /app/oc /app/kubectl /app/Dockerfile /app/README.md

RUN rm openshift-client-linux-$OC_VERSION.tar.gz

RUN apk update

# Needed to run the oc binary
RUN apk add gcompat==1.1.0-r4

RUN apk add aws-cli>=2.13.25

RUN apk add openssl>=3.3.0-r0

# Fix vulnerabilities
RUN apk upgrade \
  busybox>1.36.1-r19 \
  python3>3.11.10-r0

RUN rm -rf /var/cache/apk/*

ENTRYPOINT /bin/sh
