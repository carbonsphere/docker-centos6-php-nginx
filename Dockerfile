############################################################
# Dockerfile: CentOS/PHP/Nginx
############################################################
FROM centos:centos6

MAINTAINER CarbonSphere <CarbonSphere@gmail.com>

# Add the ngix repository
ADD nginx.repo /etc/yum.repos.d/nginx.repo

# Install nginx 
RUN yum -y install nginx; yum -y clean all

# Install PHP
RUN yum -y --enablerepo=remi,remi-php56 install nginx php-fpm php-common; yum -y clean all

# Install supervisor
RUN yum install -y python-setuptools; yum -y clean all
RUN easy_install pip
RUN pip install supervisor

# Add Nginx configuration
ADD nginx.conf /etc/nginx/nginx.conf
ADD default.conf /etc/nginx/conf.d/default.conf

# Add Supervisor configuration
ADD supervisord.conf /etc/

# Add PHP empty log
RUN touch /var/log/php5-fpm.log

# Insert default php index
ADD index.php /var/www/index.php

EXPOSE 80

# Exec supervisord
CMD ["/usr/bin/supervisord", "-n","-c","/etc/supervisord.conf"]
