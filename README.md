# Docker xDebug
Docker xDebug configuration for IDE.

## Run
`bin/run.sh` and follow instructions.

## Learn
- [`php.sh`](./bin/php.sh) builds and runs Docker image.
- [`build.sh`](./docker/build.sh) installs xDebug into clean PHP image.

## FAQ
- **Docker doesn't build**. `docker ps` should be available before execution. 
- I tested it only in PhpStorm, but it should work properly elsewhere :)