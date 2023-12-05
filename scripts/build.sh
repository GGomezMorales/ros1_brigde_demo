#!/bin/bash

CURRENT_DIR="$(pwd)"

PROJECT_ROOT="$(cd "$(dirname "$0")"; cd ..; pwd)"

cd "$PROJECT_ROOT/ros1"
docker build -t ros1:noetic .

cd "$CURRENT_DIR"

cd "$PROJECT_ROOT/ros2"
docker build -t ros2:foxy .

cd "$CURRENT_DIR"
