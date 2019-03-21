Build Docker Container images of Red Hat Application Migration Toolkit(RHAMT) Web Console on OpenShift
=========

This repo contains customized RH-SSO theme, configuration to build RHAMT Web console image with overlay RH-SSO server.

Requirements
------------

Docker verion 1.13
OpenShift Version 3.11.x

Test locally
------------

```
# cd rhamt-web-openshift
# sudo docker build -t quay.io/openshiftlabs/rhamt-web-openshift:4.2.0.Final .

# cd rhamt-web-openshift-messaging-executor
# sudo docker build -t quay.io/openshiftlabs/rhamt-web-openshift-messaging-executor:4.2.0.Final .