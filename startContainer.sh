#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${DIR}/src/boot.sh"

container_id=$(docker ps -aqf "name=$container_name")

port=80

echo -e "${GR}Starting container ...${NC}"

if [[ ! -z "$1" ]]
  then
    port=$1

fi

echo "port: $port"

if [[ $port -ne "80" ]]; then

    echo "Port specified, killing previous container if any"

    if [[ ! -z  $container_id  ]]; then
        sh ${DIR}/killContainer.sh
        container_id=$(docker ps -aqf "name=$container_name")
    fi
fi


if [[ -z  $container_id  ]]; then

    echo "${Y}## No container, creating one from image.${NC}";
    docker run -dt --name $container_name -p "$port":80 -v "$PWD":/var/www $container_name
else

    docker start $container_name;
fi

docker exec -it $container_name \/bin\/bash


