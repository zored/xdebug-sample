#!/usr/bin/env bash

# Install xDebug:
yes | pecl install xdebug

# Activate and configure xDebug:
cat <<INI >> /usr/local/etc/php/php.ini

; https://xdebug.org/docs/
[xdebug]
zend_extension="$(php-config --extension-dir)/xdebug.so"
xdebug.remote_enable=on ; Connect to remote IDE.
xdebug.remote_autostart=on ; Debug without GET / POST variable.
xdebug.remote_port=9000 ; Default port.
; xdebug.remote_connect_back=on ; This does not work, because of bridges.
INI