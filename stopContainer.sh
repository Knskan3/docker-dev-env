#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${DIR}/src/boot.sh"

echo -e "${GR}Stopping $container_name container ...${NC}"

docker stop $container_name
