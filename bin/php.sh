#!/usr/bin/env bash

# Variables:
IMAGE=${IMAGE:-$(basename $(pwd))}
SERVER=${SERVER:-$IMAGE}
PORT=${PORT:-9000}

# Constant:
PHP_FILE='./src/index.php'

echo "Errors will stop this script."
set -e

echo "Build PHP image '$IMAGE' with xDebug (see ./docker/Dockerfile)."
docker build --tag $IMAGE ./docker

MACHINE_HOST_IP=$(
    docker-machine \
        ssh \
        ${DOCKER_MACHINE_NAME:-default} \
        "\
            netstat -rn |\
            grep ^0\.0\.0\.0 |\
            awk '{{ print \$2 }}' \
        " || echo ''
)
echo "Docker Machine Host IP: $MACHINE_HOST_IP"

IDE_IP=${IDE_IP:-$MACHINE_HOST_IP}
echo "Host IP (machine with IDE): $IDE_IP"
[[ "$IDE_IP" = "" ]] && exit 1

cat <<X
Running PHP-container with xDebug.

In your IDE:
- Add breakpoint in '$PHP_FILE'.
- Listen for debug on port $PORT.
- Add server '$SERVER'.
- Map $(pwd) -> /app.
X

docker run \
    --rm \
    -it \
    --publish $PORT:9000 \
    --volume $(pwd):/app \
    --workdir /app \
    --env XDEBUG_CONFIG="remote_host=$IDE_IP" \
    --env PHP_IDE_CONFIG="serverName=$SERVER" \
    $IMAGE \
        php $PHP_FILE