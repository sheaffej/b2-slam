FROM ros:melodic-perception-bionic

WORKDIR /root
SHELL [ "bash", "-c"]
ENV ROS_WS /ros

RUN apt-get update \
&& apt install -y \
    ninja-build \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install cartographer_ros
# https://google-cartographer-ros.readthedocs.io/en/latest/compilation.html
RUN mkdir -p ${ROS_WS} \
&& cd ${ROS_WS} \
&& wstool init src \
&& wstool merge -t src https://raw.githubusercontent.com/googlecartographer/cartographer_ros/master/cartographer_ros.rosinstall \
&& wstool update -t src

# Patch Cartographer's map_by_time.h
COPY patches patches
RUN patch ${ROS_WS}/src/cartographer/cartographer/sensor/map_by_time.h ./patches/map_by_time.patch

RUN cd ${ROS_WS} \
&& src/cartographer/scripts/install_proto3.sh \
&& rm -Rf protobuf

COPY b2_slam ${ROS_WS}/src/b2_slam

RUN cd ${ROS_WS}/src \
&& git clone https://github.com/sheaffej/b2_description.git

RUN cd ${ROS_WS} \
&& apt update \
&& rosdep update \
&& rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN source /opt/ros/${ROS_DISTRO}/setup.bash \
&& cd ${ROS_WS}/src \
&& catkin_init_workspace \
&& cd ${ROS_WS} \
&& catkin_make_isolated --use-ninja 


COPY demos demos

COPY ./entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "bash" ]