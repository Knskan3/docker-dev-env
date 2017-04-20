#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${DIR}/src/boot.sh"

echo "${GR}Creating new image from Dockerfile${NC}";

docker build --no-cache -t $container_name .
