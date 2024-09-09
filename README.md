# OpenShift Backup utility
This image packages CLI utilities such as `aws-cli` along with the `oc` client to enable you to performan cluster adminstration function effectively

## How to build
Simply use `docker` or `podman` to build the image
```bash
docker build .
```

## Image repository
Find the image you want on [Dockerhub](https://hub.docker.com/r/frenoid/ocp-etcd-backup)

## Navigating the repo
The tags are sorted by OpenShift version and version of the utility.

For example, if you're looking for OpenShift version `4.13.15` and `v1` of the utility, see the tag [4.13.15-v1](https://github.com/frenoid/ocp-etcd-backup/tree/4.13.15-v1)


## What is the OpenShift Client

The OpenShift client `oc` simplifies working with Kubernetes and OpenShift
clusters, offering a number of advantages over `kubectl` such as easy login,
kube config file management, and access to developer tools. The `kubectl`
binary is included alongside for when strict Kubernetes compliance is necessary.

To learn more about OpenShift, visit [docs.openshift.com](https://docs.openshift.com)
and select the version of OpenShift you are using.

### How to Install

After extracting this archive, move the `oc` and `kubectl` binaries
to a location on your PATH such as `/usr/local/bin`. Then run:

    oc login [API_URL]

to start a session against an OpenShift cluster. After login, run `oc` and
`oc help` to learn more about how to get started with OpenShift.

### License

OpenShift is licensed under the Apache Public License 2.0. The source code for this
program is [located on github](https://github.com/openshift/oc).
