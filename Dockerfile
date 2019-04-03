FROM gitpod/workspace-full

USER root

RUN apt-get update && apt-get -y install apache2 mysql-server

RUN echo "include /workspace/lamp-example/apache/apache.conf" > /etc/apache2/apache2.conf
#RUN echo "ps h -p $$ -o args='' | cut -f1 -d' '" > /etc/apache2/envvars
RUN echo "source /workspace/lamp-example/apache/envvars" >> /etc/apache2/envvars



RUN chown gitpod:gitpod /var/run/apache2 /var/lock/apache2

#RUN chown gitpod:gitpod /etc/apache2 \
#    && chown -R gitpod:gitpod /var/lib/apache2 \
#    && chown -R gitpod:gitpod /var/log/apache2 \
#    && chown -R gitpod:gitpod /var/lib/php \
#    && chown -R gitpod:gitpod /etc/php \
#    && chown -R gitpod:gitpod /run/lock/apache2 \
#    && chown -R gitpod:gitpod /etc/mysql \
#    && chown -R gitpod:gitpod /usr/share/mysql \
#    && chown -R gitpod:gitpod /usr/lib/mysql

RUN addgroup gitpod www-data

RUN mkdir /workspace
RUN chown -R gitpod:gitpod /workspace
USER gitpod
RUN cd /workspace && git clone https://github.com/meysholdt/laravel-apache-mysql-php-in-gitpod-example.git lamp-example