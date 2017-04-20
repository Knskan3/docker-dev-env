#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${DIR}/src/boot.sh"

if [ "$1" == "all" ]; then

    echo "${GR}Killing all the containers in your machine ${NC}"

    if [[ ! -z $(docker ps -qa) ]]; then
        docker rm $(docker ps -qa) -f
    fi

else

    echo "${GR}Killing $container_name container ${NC}"
    docker rm $container_name -f
fi

