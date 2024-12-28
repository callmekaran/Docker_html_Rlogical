FROM ubuntu:latest
RUN apt update && apt install -y apache2 \
    zip \
    wget
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
EXPOSE 80
RUN rm -r /var/www/html/
WORKDIR /var/www/html/
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip
WORKDIR /var/www/html/
RUN unzip kindle.zip
MAINTAINER karanravat60@gmail.com
RUN cp -r markups-kindle/* .
ENTRYPOINT ["apache2ctl"]
CMD ["-DFOREGROUND"]
