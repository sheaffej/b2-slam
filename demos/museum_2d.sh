#!/usr/bin/env bash

# MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

apt update
apt install -y wget

wget -c -P `pwd` https://storage.googleapis.com/cartographer-public-data/bags/backpack_2d/cartographer_paper_deutsches_museum.bag
roslaunch cartographer_ros demo_backpack_2d.launch bag_filename:=`pwd`/cartographer_paper_deutsches_museum.bag
