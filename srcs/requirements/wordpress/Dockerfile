FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install php -y && apt install php-fpm -y && apt install php-mysql -y && apt install curl -y

COPY ./conf/wp-config.php /

COPY ./tools/script.sh / 

ENTRYPOINT ["/script.sh"]

