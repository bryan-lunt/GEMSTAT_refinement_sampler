#!/bin/bash

###Snippet from http://stackoverflow.com/questions/59895/
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
###end snippet

CONTAINER_VERSION="v0.1"

docker build -t gs_sampler_test ${SCRIPT_DIR} || exit 1
