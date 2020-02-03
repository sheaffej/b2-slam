#!/usr/bin/env bash

DOCKER_IMAGE=sheaffej/b2-slam
ROS_MASTER_URI=http://docker-server:11311/

docker run -it --rm \
--net host \
--privileged \
--env DISPLAY \
--env ROS_MASTER_URI=$ROS_MASTER_URI \
$DOCKER_IMAGE $@
