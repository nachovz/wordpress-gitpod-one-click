FROM gitpod/workspace-full

USER root

RUN apt-get update && apt-get -y install apache2 mysql-server

RUN chown gitpod:gitpod /etc/apache2 \
    && chown -R gitpod:gitpod /var/lib/apache2 \
    && chown -R gitpod:gitpod /var/log/apache2 \
    && chown -R gitpod:gitpod /var/lib/php \
    && chown -R gitpod:gitpod /etc/php \
    && chown -R gitpod:gitpod /run/lock/apache2 \
    && chown -R gitpod:gitpod /etc/mysql \
    && chown -R gitpod:gitpod /usr/share/mysql \
    && chown -R gitpod:gitpod /usr/lib/mysql

RUN addgroup gitpod www-data