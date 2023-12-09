#!/bin/bash

set -e

CURRENT_DIR="$(pwd)"

PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"
source ${PROJECT_ROOT}/config.sh

cd "$PROJECT_ROOT/ros1"
docker build -t ${DOCKER_IMAGE_NAME_ROS1} .

cd "$CURRENT_DIR"

cd "$PROJECT_ROOT/ros2"
docker build -t ${DOCKER_IMAGE_NAME_ROS2} .

cd "$CURRENT_DIR"
