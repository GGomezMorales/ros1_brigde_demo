FROM ros:foxy-ros-base-focal

RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-keys F42ED6FBAB17C654

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Install ROS1
RUN apt-get update && apt-get install -y \
    ros-noetic-teleop-twist-keyboard

# Install ROS2 dependencies
RUN apt-get update && apt-get install -y \
    ros-foxy-turtlesim \
    ros-foxy-ros1-bridge

COPY ./autostart.sh /
RUN chmod +x /autostart.sh
ENTRYPOINT /autostart.sh
