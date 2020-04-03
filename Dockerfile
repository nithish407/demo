FROM centos

MAINTAINER sridhar@pushtii.com

RUN yum install httpd -y

COPY index.html /var/www/html/index.html

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]


