# Docker xDebug
Docker xDebug configuration for IDE.

## Run
- Put breakpoint in your IDE `src/index.php`.
- Run `bin/run.sh` and follow instructions.
- **Have fun**.

## Learn
- [`php.sh`](./bin/php.sh) builds and runs Docker image.
- [`build.sh`](./docker/build.sh) installs xDebug into clean PHP image.

## FAQ
- **`Host IP` is empty.** You may specify your host IP with PhpStorm using: `IDE_IP=1.2.3.4 bin/run.sh`.
- **Stuck on `Build PHP image`**. You should be in Docker context being able to run at least `docker ps`. 