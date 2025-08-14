FROM ubuntu:latest
RUN apt update && apt install -y apache2 \
    zip \
    wget \
    openssl
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
EXPOSE 80
RUN rm -r /var/www/html/
WORKDIR /var/www/html/
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip
RUN unzip mediplus-lite.zip
MAINTAINER karanravat60@gmail.com
RUN cp -r mediplus-lite/* .
ENTRYPOINT ["apache2ctl"]
CMD ["-DFOREGROUND"]
