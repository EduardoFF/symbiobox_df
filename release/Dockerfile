FROM ros:jade-ros-base

MAINTAINER Eduardo Feo eduardo@idsia.ch

USER root
ENV HOME /home/root

RUN apt-get update && apt-get install -y \
    build-essential \
    libgps-dev \
    ros-jade-diagnostic-updater \
    git \
    autoconf \
    automake \
    autopoint \
    libglib2.0-dev \
    libtool \
    python-dev \
    libgoogle-glog-dev \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp
RUN git clone https://github.com/lcm-proj/lcm /tmp/lcm
RUN /bin/bash -c 'pushd /tmp/lcm; ./bootstrap.sh; ./configure --prefix=/usr; make; make install; popd; rm -r /tmp/lcm'

RUN set -x \
&& git clone https://github.com/attie/libxbee3.git /tmp/libxbee3 \
&& ( cd /tmp/libxbee3  && git checkout ) \
&& cd /tmp/libxbee3 && make configure && make install \
&& rm -rf /tmp/libxbee

RUN /bin/bash -c '. /opt/ros/jade/setup.bash; rosdep init; rosdep update'

RUN mkdir -p /home/root/catkin_ws/src
RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_init_workspace ~/catkin_ws/src'

RUN git clone https://github.com/jeguzzi/gps_umd.git ~/catkin_ws/src/gps_umd


RUN git clone https://github.com/EduardoFF/nccr_manet.git ~/catkin_ws/src/nccr_manet
RUN git clone https://github.com/EduardoFF/nccr_manet_msgs.git ~/catkin_ws/src/nccr_manet_msgs


RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_make -j1 -C ~/catkin_ws'
RUN /bin/sed -i \
    '/source "\/opt\/ros\/$ROS_DISTRO\/setup.bash"/a source "\/home\/root\/catkin_ws\/devel\/setup.bash"'\
    /ros_entrypoint.sh

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

RUN /bin/bash -c '. /opt/ros/jade/setup.bash; catkin_make -j1 -C ~/catkin_ws'

RUN /bin/bash -c 'pushd ~/catkin_ws/src/nccr_manet; git pull; popd'
RUN /bin/bash -c 'pushd ~/catkin_ws/src/nccr_manet_msgs; git pull; popd'

VOLUME /home/root/

