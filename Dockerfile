FROM gitpod/workspace-full

USER root

RUN apt-get update && apt-get -y install apache2 mysql-server

RUN echo "include /workspace/lamp-example/apache/apache.conf" > /etc/apache2/apache2.conf
RUN echo "# modified by Gitpod" > /etc/apache2/envvars

RUN echo "unset HOME" >> /etc/apache2/envvars
RUN echo "export LANG=C" >> /etc/apache2/envvars
RUN echo "export APACHE_RUN_USER=www-data" >> /etc/apache2/envvars
RUN echo "export APACHE_RUN_GROUP=www-data" >> /etc/apache2/envvars
RUN echo "export APACHE_PID_FILE=/var/run/apache2$SUFFIX/apache2.pid" >> /etc/apache2/envvars
RUN echo "export APACHE_RUN_DIR=/var/run/apache2$SUFFIX" >> /etc/apache2/envvars
RUN echo "export APACHE_LOCK_DIR=/var/lock/apache2$SUFFIX" >> /etc/apache2/envvars
RUN echo "# Only /var/log/apache2 is handled by /etc/logrotate.d/apache2." >> /etc/apache2/envvars
RUN echo "export APACHE_LOG_DIR=/var/log/apache2$SUFFIX" >> /etc/apache2/envvars

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