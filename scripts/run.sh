#!/bin/bash

PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
source ${PROJECT_ROOT}/config.sh


xhost +local:root 
docker container prune -f 
docker run --privileged --rm -it \
    --name $CONTAINER_NAME \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="$XAUTH:$XAUTH" \
    -v /dev:/dev \
    -v $(pwd)/ros1_ws/src:/home/ros1_ws/src \
    -v $(pwd)/ros2_ws/src:/home/ros2_ws/src \
    -t \
    ${DOCKER_IMAGE_NAME} 
