#!/usr/bin/env bash

# Exit on error:
set -e

# Variables:
IMAGE=${IMAGE:-$(basename $(pwd))}
SERVER=${SERVER:-$IMAGE}
PORT=${PORT:-9000}
DOCKER_MACHINE_NAME=${DOCKER_MACHINE_NAME:-default}
PHP_FILE='./src/index.php'

# IDE IP (host IP):
GET_MACHINE_IP="netstat -rn | grep ^0\.0\.0\.0 | awk '{{ print \$2 }}'"
MACHINE_HOST_IP=$(docker-machine ssh $DOCKER_MACHINE_NAME "$GET_MACHINE_IP"|| echo '')
IDE_IP=${IDE_IP:-$MACHINE_HOST_IP}
if [[ "$IDE_IP" = "" ]]; then
    echo "Set host IP that is available from your container:"
    echo "IDE_IP=1.2.3.4 $0"
    exit 1
fi

# Explicit xDebug host config:
XDEBUG_CONFIG="remote_host=$IDE_IP"

# Explicit server name for PhpStorm:
PHP_IDE_CONFIG="serverName=$SERVER"

cat <<X
Running PHP-image '$IMAGE' with xDebug.

In your IDE:
- Add breakpoint in '$PHP_FILE'.
- Listen for debug on port $PORT.
- Add server '$SERVER'.
- Map local `$(pwd)` into VM path `/app`.
X

# Build image:
docker build --tag $IMAGE ./docker

# Run container:
docker run \
    --rm \
    -it \
    --publish $PORT:9000 \
    --volume $(pwd):/app \
    --workdir /app \
    --env XDEBUG_CONFIG="$XDEBUG_CONFIG" \
    --env PHP_IDE_CONFIG="$PHP_IDE_CONFIG" \
    $IMAGE \
    php $PHP_FILE