# Docker xDebug
Docker xDebug configuration for IDE.

## Run
`bin/run.sh` and follow instructions.

## Learn
- [`php.sh`](./bin/php.sh) builds and runs Docker image.
- [`build.sh`](./docker/build.sh) installs xDebug into clean PHP image.

## FAQ
- **`Host IP` is empty.** Host is machine with your IDE. xDebug needs to know where it definitely is from your machine or container. You may specify it with: `IDE_IP=1.2.3.4 bin/run.sh`.
- **Docker doesn't build**. `docker ps` should be available before execution. 
- I tested it only in PhpStorm, but it should work properly elsewhere :)