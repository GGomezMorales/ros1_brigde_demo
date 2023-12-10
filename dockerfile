FROM ros:foxy-ros-base-focal

# Link to allow sourcing
RUN rm /bin/sh && ln -s /bin/bash /bin/sh 

# Update GPG key
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-keys AD19BAB3CBF125EA
# Add ROS repository
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# Update GPG key
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-keys F42ED6FBAB17C654

RUN apt-get update && apt-get install -q -y --no-install-recommends \
    dirmngr \
    gnupg2 

RUN mkdir -p /ros2_ws/src
RUN mkdir -p /ros1_ws/src

# Install ROS1
RUN apt-get update && apt-get install -y \
    ros-noetic-ros-base \
    ros-noetic-teleop-twist-keyboard

# Install ROS2 dependencies
RUN apt-get update && apt-get install -y \
    ros-foxy-turtlesim \
    ros-foxy-ros1-bridge \
    qtbase5-dev \
    libqt5widgets5 \
    x11-apps

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc

# Building ROS 1 workspace in dockerfile
RUN cd /ros1_ws && source /opt/ros/noetic/setup.bash && catkin_make
RUN echo "source /ros1_ws/devel/setup.bash" >> ~/.bashrc

# Building ROS 2 workspace in dockerfile
RUN cd /ros2_ws && source /opt/ros/foxy/setup.bash && colcon build
RUN echo "source /ros2_ws/install/setup.bash" >> ~/.bashrc

COPY ./autostart.sh /
RUN chmod +x /autostart.sh
ENTRYPOINT /autostart.sh
CMD ["bash"]
