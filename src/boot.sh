#!/bin/bash

# formatting

GR='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'
Y='\033[1;33m'
bold=$(tput bold)
normal=$(tput sgr0)


# Checks is we are running the script from the root folder.

initFile=${PWD}/dockerConf.sh

if [[ ! -f $initFile ]]; then

    echo -e "${RED}## Error: dockerInit File is not present in the project root folder.${NC}"
    exit 1
fi

source $initFile

echo "Working on: $container_name"

if [[ ! -f ${PWD}/Dockerfile ]]; then

    echo -e "${RED}## Error: You have to run the script from the root project folder.${NC}"
    exit 1
fi
