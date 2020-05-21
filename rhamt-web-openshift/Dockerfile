FROM docker.io/windup3/windup-web-openshift:4.3.1.Final

EXPOSE 8080

LABEL description="Red Hat Application Migration Toolkit Web Console" \
      version="4.0.0-SNAPSHOT" \
      io.k8s.description="Red Hat Application Migration Toolkit Web Console" \
      io.k8s.display-name="RHAMT Web Console" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="rhamt,migration"

# ADD keycloak-server-overlay-4.8.3.Final.zip /opt/tools/keycloak-server-overlay/
ADD monolith.war /opt/apps/
ADD monolith-fixed.war /opt/solution/

user 0

RUN chown --recursive jboss:0 /opt/eap
RUN chgrp -R 0 /opt/eap \
  && chgrp -R 0 /home/jboss \
  && chmod -R g+rwX /opt/eap \
  && chmod -R g+rwX /home/jboss

user jboss

ENTRYPOINT /opt/eap/bin/webapp-launch.sh -b 0.0.0.0
