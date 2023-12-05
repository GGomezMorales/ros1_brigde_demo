#!/bin/bash

PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
source ${PROJECT_ROOT}/config.sh

docker run -itd --name $CONTAINER_NAME_ROS2 --network $ROS_NETWORK ros2:foxy
