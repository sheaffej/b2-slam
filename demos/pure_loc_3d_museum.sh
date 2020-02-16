#!/usr/bin/env bash

apt update
apt install -y wget

# Download the 3D bags from the Deutsche Museum:

# https://storage.googleapis.com/cartographer-public-data/bags/backpack_3d/
wget -c -P ~/Downloads https://weaselnas/rosbags/b3-2016-04-05-13-54-42.bag

# https://storage.googleapis.com/cartographer-public-data/bags/backpack_3d/b3-2016-04-05-15-52-20.bag
wget -c -P ~/Downloads https://weaselnas/rosbags/b3-2016-04-05-15-52-20.bag

# Generate the map (wait until cartographer_offline_node finishes) and then run pure localization:
roslaunch cartographer_ros offline_backpack_3d.launch bag_filenames:=${HOME}/Downloads/b3-2016-04-05-13-54-42.bag

exit

roslaunch cartographer_ros demo_backpack_3d_localization.launch \
   load_state_filename:=${HOME}/Downloads/b3-2016-04-05-13-54-42.bag.pbstream \
   bag_filename:=${HOME}/Downloads/b3-2016-04-05-15-52-20.bag

