FROM ros:foxy-ros-base-focal

# Link to allow sourcing
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Update GPG key
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-keys F42ED6FBAB17C654

# Add ROS repository
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# # Create ROS 1 workspace
RUN mkdir -p /ros1_ws/src

# Install ROS1
RUN apt-get update && apt-get install -y \
    ros-noetic-teleop-twist-keyboard

# Install ROS2 dependencies
RUN apt-get update && apt-get install -y \
    ros-foxy-turtlesim \
    ros-foxy-ros1-bridge

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc

# Building ROS 1 workspace in dockerfile
RUN cd /ros1_ws && source /opt/ros/noetic/setup.bash && catkin_make
RUN echo "source /ros1_ws/devel/setup.bash" >> ~/.bashrc

COPY ./autostart.sh /
RUN chmod +x /autostart.sh
ENTRYPOINT /autostart.sh
# ENTRYPOINT ["bash"]
