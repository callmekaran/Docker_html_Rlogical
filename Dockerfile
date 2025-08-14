FROM ubuntu:latest
RUN apt update && apt install -y apache2 \
    zip \
    wget \
    openssl
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
EXPOSE 80
RUN rm -r /var/www/html/
WORKDIR /var/www/html/
RUN wget https://templatemo.com/download/templatemo_593_personal_shape
MAINTAINER karanravat60@gmail.com
ENTRYPOINT ["apache2ctl"]
CMD ["-DFOREGROUND"]
