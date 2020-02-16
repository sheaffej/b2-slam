#!/usr/bin/env bash

DOCKER_IMAGE=sheaffej/b2-slam
ROS_MASTER_URI=http://docker-server:11311/

DOWNLOADS_DIR=~/Downloads

docker run -it --rm \
--net host \
--privileged \
--env DISPLAY \
--env ROS_MASTER_URI=$ROS_MASTER_URI \
--mount type=bind,source=${DOWNLOADS_DIR},target=/root/Downloads \
$DOCKER_IMAGE $@
