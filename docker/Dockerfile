FROM php:7.1

# PHP config files directory (goo.gl/QP3FRr)
ENV PHP_INI_SCAN_DIR='/usr/local/etc/php.d'

# Build:
COPY ./build.sh .
RUN chmod +x /build.sh &&\
    /build.sh &&\
    rm /build.sh