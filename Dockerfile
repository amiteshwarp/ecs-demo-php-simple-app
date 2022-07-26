FROM php:7.3-fpm
COPY --from=mlocati/php-extension-installer:1.5.8 /usr/bin/install-php-extensions /usr/local/bin/
#It should be a part of deployment, composer not needed on live server
#COPY --from=composer:2.2.12 /usr/bin/composer /usr/local/bin/composer
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini" && \
    install-php-extensions gd sockets redis zip pdo_pgsql pgsql



#FROM public.ecr.aws/amazonlinux/amazonlinux:2
#
## Install dependencies
#RUN yum install -y \
#    curl \
#    httpd \
#    php \
# && ln -s /usr/sbin/httpd /usr/sbin/apache2
#
## Install app
#RUN rm -rf /var/www/html/* && mkdir -p /var/www/html
#ADD src /var/www/html
#
## Configure apache
#RUN chown -R apache:apache /var/www
#ENV APACHE_RUN_USER apache
#ENV APACHE_RUN_GROUP apache
#ENV APACHE_LOG_DIR /var/log/apache2
#
#EXPOSE 80
#
#CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
