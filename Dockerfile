FROM gitpod/workspace-full

USER root

RUN apt-get update && apt-get -y install apache2 mysql-server debconf-utils 

RUN echo "phpmyadmin phpmyadmin/internal/skip-preseed boolean true" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect" | debconf-set-selections
RUN echo "phpmyadmin phpmyadmin/dbconfig-install boolean false" | debconf-set-selections

RUN echo "include /workspace/lamp-example/apache/apache.conf" > /etc/apache2/apache2.conf
RUN echo ". /workspace/lamp-example/apache/envvars" > /etc/apache2/envvars

RUN echo "!include /workspace/lamp-example/mysql/mysql.cnf" > /etc/mysql/my.cnf

RUN mkdir /var/run/mysqld
RUN chown gitpod:gitpod /var/run/apache2 /var/lock/apache2 /var/run/mysqld

RUN addgroup gitpod www-data

RUN apt-get -y  install phpmyadmin

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN sudo mv wp-cli.phar /usr/local/bin/wp


#RUN mkdir /workspace
#RUN chown -R gitpod:gitpod /workspace
#USER gitpod
#RUN cd /workspace && git clone https://github.com/meysholdt/laravel-apache-mysql-php-in-gitpod-example.git lamp-example
