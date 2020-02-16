#!/usr/bin/env bash

apt update
apt install -y wget

# Download the 2D bags from the Deutsche Museum:

# https://storage.googleapis.com/cartographer-public-data/bags/backpack_2d/b2-2016-04-05-14-44-52.bag
wget -c -P ~/Downloads https://weaselnas/rosbags/b2-2016-04-05-14-44-52.bag

# https://storage.googleapis.com/cartographer-public-data/bags/backpack_2d/b2-2016-04-27-12-31-41.bag
wget -c -P ~/Downloads https://weaselnas/rosbags/b2-2016-04-27-12-31-41.bag


# Generate the map (wait until cartographer_offline_node finishes) and then run pure localization:
roslaunch cartographer_ros offline_backpack_2d.launch bag_filenames:=`pwd`/b2-2016-04-05-14-44-52.bag

exit

roslaunch cartographer_ros demo_backpack_2d_localization.launch \
load_state_filename:=`pwd`/b2-2016-04-05-14-44-52.bag.pbstream \
bag_filename:=`pwd`/b2-2016-04-27-12-31-41.bag

