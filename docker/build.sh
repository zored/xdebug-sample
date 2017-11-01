#!/usr/bin/env bash

# Install xDebug:
yes | pecl install xdebug

# Add PHP config directory (goo.gl/QP3FRr):
mkdir -p $PHP_INI_SCAN_DIR

# Activate and configure xDebug:
cat <<INI > $PHP_INI_SCAN_DIR/xdebug.ini
[xdebug]
zend_extension="$(php-config --extension-dir)/xdebug.so"
xdebug.remote_enable=on
xdebug.remote_autostart=on
xdebug.remote_port=9000
INI