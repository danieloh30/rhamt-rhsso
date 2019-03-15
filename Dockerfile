# Copyright 2019 Red Hat
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ------------------------------------------------------------------------
#
# This is a Dockerfile for the openshiftlabs/rhamt:4.2.0 image.

FROM docker.io/windup3/windup-web-openshift:4.2.0.Final

MAINTAINER Daniel Oh

EXPOSE 8080

LABEL description="Red Hat Application Migration Toolkit Web Console" \
      version="4.0.0-SNAPSHOT" \
      io.k8s.description="Red Hat Application Migration Toolkit Web Console" \
      io.k8s.display-name="RHAMT Web Console" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="rhamt,migration,ccnworkshop"


ADD keycloak-server-overlay-2.5.5.Final.zip /opt/tools/keycloak-server-overlay/

user 0

RUN chown --recursive jboss:0 /opt/eap
RUN chgrp -R 0 /opt/eap \
  && chgrp -R 0 /home/jboss \
  && chmod -R g+rwX /opt/eap \
  && chmod -R g+rwX /home/jboss

user jboss

ENTRYPOINT /opt/eap/bin/webapp-launch.sh -b 0.0.0.0
