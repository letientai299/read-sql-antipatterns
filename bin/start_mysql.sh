#!/bin/sh

WORKING_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$WORKING_DIR/.." || exit


docker stop antipatterns-mysql

# Start mysql container and bind the code folder into the container
docker run -d --rm -p 3306:3306 \
  -v $PWD:/antipatterns/ \
  --name antipatterns-mysql \
  -e MYSQL_ALLOW_EMPTY_PASSWORD=yes \
  mysql

