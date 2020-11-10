#!/bin/bash

set -euo pipefail

CONTAINER_TAG=salesforce_log_scraper

COMMAND=${1:-}
if [[ -z "$COMMAND" ]]; then
  echo
  echo "COMMAND is empty!  Try help :)"
  echo "Exiting."
  exit 1
elif
    [[ $COMMAND != "docker-clean-unused" ]] &&
    [[ $COMMAND != "-c" ]] &&
    [[ $COMMAND != "--clean" ]] &&
    [[ $COMMAND != "docker-clean-all" ]] &&
    [[ $COMMAND != "build" ]] &&
    [[ $COMMAND != "-b" ]] && 
    [[ $COMMAND != "--build" ]] &&
    [[ $COMMAND != "run" ]] &&
    [[ $COMMAND != "-r" ]] &&
    [[ $COMMAND != "--run" ]] &&
    [[ $COMMAND != "test" ]] &&
    [[ $COMMAND != "-t" ]] &&
    [[ $COMMAND != "--test" ]] &&
    [[ $COMMAND != "stop" ]] &&
    [[ $COMMAND != "-s" ]] &&
    [[ $COMMAND != "--stop" ]]

then
    echo
    echo "Maybe you need some help:

The usage pattern is

bash runDocker.sh [COMMAND]

COMMANDS:
docker-clean-unused,-c,--clean:         Delete unused Docker containers.
docker-clean-all:                       Delete *ALL* Docker containers.
build,-b,--build:                       Build the Docker container.
run,-r,--run                            Run reviseJson.py on given file.
test,-t,--test:                         Run unit tests.
stop,-s,--stop:                         Stop the container."
  exit 1
fi

case $COMMAND in

docker-clean-unused | -c | --clean)

  echo
  echo "Deleting all unused Docker containers."
  docker system prune --all --force --volumes
  ;;

docker-clean-all)

  echo
  echo "Deleting *ALL* Docker containers, running or not!"
  docker container stop $(docker container ls --all --quiet) && docker system prune --all --force --volumes
  ;;

build | -b | --build)

  echo
  echo "Building the container and tagging it $CONTAINER_TAG."
  docker build --tag $CONTAINER_TAG .
  ;;

run | -r | --run)

  echo
  echo "Running reviseJsonFile.py in the $CONTAINER_TAG container."
  echo "Input file is $2"
  echo
  docker run -v $2:/app/LogFile.log -t $CONTAINER_TAG:latest
  ;;

test | -t | --test)

  echo
  echo "Running reviseJsonFile_test.py in the $CONTAINER_TAG container."
  docker run -t $CONTAINER_TAG:latest python3 reviseJsonFile_test.py
  ;;

stop | -s | --stop)

  echo
  echo "Stopping the $CONTAINER_TAG container."
  docker container stop $(docker ps -q --filter ancestor=$CONTAINER_TAG)
  ;;

esac
