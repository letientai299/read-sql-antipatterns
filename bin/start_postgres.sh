#!/bin/sh

WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$WORKING_DIR/.." || exit


docker stop antipatterns-pg
docker rm antipatterns-pg

# Start postgres container and bind the code folder into the container
docker run -d --rm -p 5432:5432 \
  -v $PWD:/antipatterns/ \
  --name antipatterns-pg \
  postgres
