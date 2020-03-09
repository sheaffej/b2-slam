#!/usr/bin/env bash

DOCKER_IMAGE=sheaffej/b2-slam
ROS_MASTER_URI=http://docker-server:11311/

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJ_DIR=$MYDIR/..  # Directory containing the cloned git repos


DOWNLOADS_DIR=~/Downloads

docker run -it --rm \
--net host \
--privileged \
--env DISPLAY \
--env ROS_MASTER_URI=$ROS_MASTER_URI \
--mount type=bind,source=$PROJ_DIR/b2_slam,target=/ros/src/b2_slam \
--mount type=bind,source=${DOWNLOADS_DIR},target=/root/Downloads \
$DOCKER_IMAGE roslaunch b2_slam b2_2d.launch

