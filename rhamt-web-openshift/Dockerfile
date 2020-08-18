FROM docker.io/windup3/windup-web-openshift:5.0.0.Final

EXPOSE 8080

LABEL description="Migration Toolkit for Applications" \
      version="5.0.0.Final" \
      io.k8s.description="Migration Toolkit for Applications" \
      io.k8s.display-name="MTA Web Console" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="mta,migration,ccn" \
      maintainer="doh@redhat.com"

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
