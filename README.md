## Docker Tooling for local dev environment ##

This repo contains all the scripts needed to run the local docker environment under maverick repositories.
It depends on the existence of a `dockerConf.sh` file under the root folder of the project.

This repo should live as a submodule of the main one.

This repo was created as this scripts are the same across all the products we develop.


## WORKING ENVIRONMENT ( FOLLOW THIS INSTRUCTIONS OVER YOUR HOST REPOSITORY )

We have a new dockerized working environment to avoid working in our own machines. This will provide an unified, stable and fast working env for all the devs. https://docs.docker.com/

The idea is to work within a container generated from a imagen (which at the moment each dev will have to generate).

### Cloning

Make sure you have your submodules updated for this repo as the docker tooling is a new subdmoule.

`git submodule init`
`git submodule update`

First step is to download docker from: <https://www.docker.com/community-edition>. Make sure you execute it after install.

Under `./docker-local-env` you will find a set of scripts to build and opperate your dev environment.

### Config file

Docker tooling relies on the existence of a config file under the host repository root folder. You can find a template in this repo at `src/initTemplate/dockerConf.sh`. In case its not present yet, copy, then edit the content to change de container name.

### Setup / Spin up


Apache will be spawned every time you run the container, under port 80. This port is exposed to your computer so you can now navigate to localhost in your browser. Apache root will be map to `/var/www` under the container (the working directory).

Your local files would be automatically map to `/var/www` under the container (the working directory). So you just need to touch files locally, and run grunt/node/whatever within the container.

1. First you have to build the image. `sh ./docker-local-env/buildImage.sh`
2. Then you are ready to work!. Next step is to run your container `sh ./docker-local-env/startContainer.sh`.
3. Step 2 will leave you directly inside your container terminal. If this is the first time you would like to run `npm update`.

### Start / Stop

You can start the container with `sh ./docker-local-env/startContainer.sh`.
You can stop the container with `sh ./docker-local-env/stopContainer.sh`.

Note that you can add an extra paramenter to startContainer.sh [port] which will determinate the port exposed to the host machine. (default is 80)

### Killing container

If by any reason you need to destroy your container you can use `sh ./docker-local-env/killContainer.sh`.
