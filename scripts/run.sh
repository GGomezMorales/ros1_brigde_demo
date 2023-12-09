#!/bin/bash

PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
source ${PROJECT_ROOT}/config.sh

docker run -itd \
    --name $CONTAINER_NAME_ROS1 \
    --network $ROS_NETWORK \
    ${DOCKER_IMAGE_NAME_ROS1}

docker run -itd \
    --name $CONTAINER_NAME_ROS2 \
    --network $ROS_NETWORK \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    ${DOCKER_IMAGE_NAME_ROS2}
